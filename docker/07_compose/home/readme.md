# How to Install Home Assistant using Docker Compose

Now that we have gone over the differences between the variants of Home  Assistant let us move on to how to use Docker Compose to install this  smart home software.

During these installation steps, we will add a couple of other crucial pieces of software you will likely want to use.

Thanks to Docker compose, installing additional software is super simple and we can keep it all within the same file.

## Preparing for Home Assistant

Thanks to the Docker container for Home Assistant, there isn’t much we must do to set it up.

**1.** Before proceeding, you must install Docker on your operating system. We have guides that cover this for the [Raspberry Pi](https://pimylifeup.com/raspberry-pi-docker/) and [Ubuntu](https://pimylifeup.com/ubuntu-install-docker/).

Once you have installed Docker and ensured it works, you can start this guide.

**2.** Another essential thing to have set up is a static IP address for the device you plan to run Home Assistant on.

This home automation system often needs to communicate back and forth with  devices, so having an IP that changes can break things. Additionally, it makes it a lot easier to manage when you know what IP address it will  always be on.

The best way to set a static IP address is through your routers DHCP reservations. However, we do have guides on [setting a static IP address on Ubuntu](https://pimylifeup.com/ubuntu-20-04-static-ip-address/) and a [Raspberry Pi](https://pimylifeup.com/raspberry-pi-static-ip-address/).

**3.** Our next step is to create a folder to keep the Home Assistant Docker Compose file. This directory will be located at “`/opt/stacks/hass`“.

You can create this directory by [using the mkdir command](https://pimylifeup.com/mkdir-command-linux/), as shown below.

```bash
sudo mkdir -p /opt/stacks/hass 
```

Using the “`-p`” option ensures that mkdir can create all missing directories in the path.

**4.** After creating the new directory, we can now change to it by running the command below.

```bash
cd /opt/stacks/hass 
```

## Writing the Docker Compose File for Home Assistant

**5.** Now that we are within the correct directory, let us start writing a  Docker Compose file for Home Assistant using the command below.

We will use this Compose file to install the Home Assistant, Node-RED, and HASS Configurator containers.

While we are [using the nano text editor](https://pimylifeup.com/nano-text-editor/) in this guide, you can use whatever you feel like

```bash
sudo nano compose.yaml 
```

**6.** We will break this Compose file into multiple sections to explain what is happening.

Understanding what this Compose file for Home Assistant does will make your life easier later on if anything goes wrong.

### Docker Compose Config for Home Assistant

**a.** At the top of this file, we will add our first service. That service will be Home Assistant itself.

Home Assistant’s Docker setup doesn’t require us to specify much for it to work. The main things we need to set are the volumes.

With this configuration below, we are setting it up so Home Assistants config files will be kept within the “`/opt/stacks/hass/hass-config`” directory. 

```yaml
version: '3'
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - /opt/stacks/hass/hass-config:/config
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
    privileged: true
    network_mode: host 
```

### Config for Node-RED

**b.** The next container we will add to our Compose file is Node-RED.  Node-RED is something you will want to use alongside Home Assistant, it  makes setting up automation a straightforward process.

Using the “`depends_on`” option ensures this service only starts once Mosquitto and Home Assistant have started.

You must replace “`<TIMEZONE>`” with a valid TZ Timezone value. You can find the identifier using the [list of tz database time zones on Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

For example, living in Hobart, Australia, I would use “`Australia/Hobart`” for my time zone.

```yaml
  nodered:
    container_name: nodered
    image: nodered/node-red
    ports:
      - 1880:1880
    volumes:
      - /opt/stacks/hass/nodered:/data
    depends_on:
      - homeassistant
      - mosquitto
    environment:
      - TZ=<TIMEZONE>
    restart: unless-stopped 
```

### Setting up a Mosquitto Broker

**c.** Our next container is for Mosquitto. This MQTT broker service can work alongside our Home Assistant Docker container.

MQTT acts like a messaging service that makes it easier for Home Assistant  to send and receive messages from sensors and other devices.

Like Node-RED above, you must replace “`<TIMEZONE>`” with your time zone.

```yaml
  mosquitto:
    image: eclipse-mosquitto
    container_name: mosquitto
    restart: unless-stopped
    ports:
      - 1883:1883
      - 9001:9001
    volumes:
      - "/opt/stacks/hass/mosquitto/config:/mosquitto/config"
      - "/opt/stacks/hass/mosquitto/data:/mosquitto/data"
      - "/opt/stacks/hass/mosquitto/log:/mosquitto/log"
    environment:
      - TZ=<TIMEZONE>
    user: "${PUID}:${PGID}" 
```

### Adding HAAS Configurator for Easy File Editing

**d.** The final service we want to add to our Home Assistant Docker Composer setup is for HAAS Configurator.

This tool will allow us to quickly and easily edit Home Assistant’s configuration files from the web browser.

```yaml
  hass-configurator:
    image: "causticlab/hass-configurator-docker:latest"
    restart: always
    ports:
      - "3218:3218/tcp"
    volumes:
      - "/opt/stacks/hass/configurator-config:/config"
      - "/opt/stacks/hass/hass-config:/hass-config" 
```

### Save your Changes

**7**. With that done, we have now finished writing the compose file for our Home Assistant setup.

If you are using nano like we are, you can save and quit by pressing CTRL + X, Y, and then ENTER.

## Setting up Mosquitto for your Docker Compose

Before we can start up our Docker Compose file for Home Assistant, we must do some additional configuration for mosquitto.

### Writing the Config File for Mosquitto

**8.** There are a couple of things that we want to enable for Mosquitto that aren’t in the default configuration.

Namely, we want to enable data persistence and specify the location for Mosquitto to log data.

To do this, let us first create the directory where this config file will be stored by running the following command.

```bash
sudo mkdir -p /opt/stacks/hass/mosquitto/config 
```

**9.** Once we have created the directory to store the config file, we can begin writing it using the below command.

```bash
sudo nano /opt/stacks/hass/mosquitto/config/mosquitto.conf 
```

**10.** Within this file, enter the following lines.

```
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
listener 1883
listener 9001
allow_anonymous true 
```

**11.** After finishing entering the lines above, save and quit by pressing CTRL + X, then Y, and finally ENTER.

### Creating a User for the Mosquitto Docker Container

**12.** The Mosquitto Docker container is set up to use a very specific user with a UID and GID of 1883. 

First, we can use the following command to create a group with the name “`mosquitto`” and the GID of 1883.

```bash
sudo groupadd -g 1883 mosquitto 
```

**13.** With the group created, we can now create the user by using the following command. Here, we need to pass in “`1883`” for the user and group IDs.

```bash
sudo useradd -u 1883 -g 1883 mosquitto 
```

**14.** Finally, with the user created, we want it to take ownership of the “`mosquitto`” directory within our folder.

```bash
sudo chown -R mosquitto: /opt/stacks/hass/mosquitto 
```

## Creating a Directory for Node-RED

**15.** Due to the Node-RED container wanting to operate under the user with  the UID 1000, we must create the directory and take ownership of it.

First, create the directory by using the following command.

```bash
sudo mkdir /opt/stacks/hass/nodered 
```

**16.** After creating the required directory, take ownership of it by running the command below.

```bash
sudo chown 1000:1000 /opt/stacks/hass/nodered 
```

## Configuring HASS Configurator

**17.** Our next step is configuring the HASS Configurator to look within the correct directory.

Start by creating the directory for the configurator’s config directory.

```bash
sudo mkdir /opt/stacks/hass/configurator-config 
```

**18.** After creating the directory, we can begin writing the settings file using the command below within the terminal.

```bash
sudo nano /opt/stacks/hass/configurator-config/settings.conf 
```

**19.** We can now use this configuration file to set the editors base path to  where our Home Assistant Docker Compose setups settings will sit.

```
{
    "BASEPATH": "../hass-config"
} 
```

**20.** After making these changes to the config file, you can save and quit by pressing CTRL + X, followed by Y, and finally, the ENTER key.

## Starting up Home Assistant using Docker Compose

**21.** We are finally at the point where our Docker Compose file is now ready to start up.

All you need to do to start Home Assistant is use the following command.  Please note that this process can take a few minutes as there are a few  things to download and start.

Using the “`-d`” option, we are telling Docker to detach from the current terminal session once it has successfully started.

```bash
sudo docker compose up -d 
```

## Connecting to your Home Assistant Docker Compose Setup

At this point, you should now have Home Assistant successfully running under Docker on your device.

This section will show you how to access your new Home Assistant  installation and then configure Node-RED and MQTT. Unlike using add-ons, we need to manually configure the home automation server to utilize  what we just added.

## First Run of Home Assistant

**1.** To access the web interface for Home Assistant, all you need to do is go to your device’s IP Address followed by port `8123`.

```
http://<IPADDRESS>:8123 
```

**2.** Follow the prompts to set up your account for Home Assistant and some  additional information about yourself to help with automation.

These steps are super simple, so we won’t be walking you through them in this particular guide.

![Welcome to Home Assistant Docker Compose Installation](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-01-Welcome-to-Home-Assistant.jpg)

## Adding Dashboards for Node-Red and Configurator

**3.** Once you have run through the initial setup steps for your Home  Assistant Docker Compose installation, we can add Node-RED and  Configurator to your Home Assistant dashboard.

It used to be possible to set up these pages using the YML configuration files

To start this process, change to the settings screen using the sidebar (**1.**).

Once on the settings screen, swap to the “`Dashboards`” screen (**2.**).

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Open-Dashboards-menu.jpg)

**4.** On the dashboard screen, click the “`ADD DASHBOARD`” button in the bottom-right corner of the screen.

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Add-new-Dashboard.jpg)

**5.** You will now see a list of the different dashboards you can add to your Home Assistant interface.

The option you will want to click is “`Webpage`“.

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Create-new-Webpage-Dashboard.jpg)

**6.** This first screen will ask you to enter the URL to the service you want loaded in your dashboard (**1.**).

In our case, we have two possible choices here. With either choice, replace “`<IPADDRESS>`” with the IP of the machine where you are hosting Home Assistant using Docker.

- **Node-RED:** `http://<IPADDRESS>:1880`
- **Configurator:** `http://<IPADDRESS>:3218`

Once you entered a URL, click the “`NEXT`” button to continue (**2.**).

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Set-URL-for-Dashboard.jpg)

**7.** You will now need to give additional information on how Node-RED or Configurator will appear in your sidebar.

- First, you will want to set the name for the service you are adding (**1.**). 

  We recommend using “`Node-RED`” for Node-RED and “`Configurator`” for Configurator.

- Your next step is to set an icon to make it easier to identify (**2.**).

  The two icons we use are “`mdi:shuffle-variant`” and “`mdi:wrench`” but you can use whichever you like.

- Once the name and icon has been set, you will want to also toggle the “`Admin only`” option on (**3.**).

  This will hide this element if the user is not an admin user.

After setting all three options, click the “`CREATE`” button. You will want to repeat from **step 4** if you happen to be using both Configurator and Node-RED.

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Fill-Out-Dashboard-Details.jpg)

**8.** After everything has been done, you should see both the “`Configurator`” and “`Node-RED`” displayed within your sidebar.

![img](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Dashboards-addeed.jpg)

## Generating an Access Token for Node Red

**9.** The next part of setting up Home Assistant with Docker Compose is to configure both Node-RED and MQTT.

Our first step is to generate an access token so that Node-RED can communicate with the home automation server.

To start this process, click your profile in the bottom-left corner.

![Open Profile](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-02-Open-Profile.jpg)

**10.** On the profile page, scroll down till you find the option labeled “`Long-lived access tokens`” and click the “`CREATE TOKEN`” button.

![Generate Long Lived Token on Home Assistant Docker Compose Setup](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-03-Create-Long-Lived-Token.jpg)

**11.** You will now be prompted to name this new token (**1.**). In our example, we will name it “`Node-RED`“.

Once you have typed a name, click the “`OK`” button (**2.**).

![Type in Name for Token](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-04-Assign-Token-a-Name.jpg)

**12.** You will now have a long string shown on your screen.   this string, as we will need it to set up Node-RED to work with our Home Assistant  Docker Compose installation.

This token allows Node-RED to communicate with the server.

![  Access Token](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-05- -Access-Token.jpg)

## Configuring Node-RED to Work With Home Assistant

**13.** Now that you have generated a token for Node-RED to use, let us change to its interface by clicking “`Node-Red`” in the sidebar.

![Open Node-RED from Home Assistant Docker Compose](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-06-Open-Node-RED.jpg)

**14.** With Node-RED now open, click the hamburger icon (Three lines) in the top-left corner (**1.**).

You should see a pop-up menu with various options. The one you must click is labeled “`Manage pallete`” (**2.**).

![Open Manage Pallate Screen](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-07-Open-Manage-Pallate-Screen.jpg)

**15.** With the Pallete menu open, change to the “Install” tab (**1.**).

Now that you have the install menu open use the search bar to look for “`node-red-contrib-home-assistant-websocket`” (**2.**).

Finally, click the “`Install`” button (3.) to install this module to Node-RED. This module allows you to perform Home Assistant actions from within Node-RED.

![Install Home Assistant Module for Node-RED](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-08-Install-Node-RED-HASS.jpg)

**16.** Before installing this addon, you will get a message about reading the nodes documentation.

You can either read this or click the “`Install`” button to continue.

![Confirm install Home Assistant Docker Compose module for Node-RED](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-09-Confirm-install-Node-RED.jpg)

## Adding your Home Assistant Docker Compose Server to Node-RED

**17.** We need to now assign your Home Assistant server as a path for Node-RED to use.

You must start this process by dragging the “`events:all`” node to your flow (**1.**).

Once dragged onto the screen, double-click the node to begin configuring it (**2.**).

![Add and Open Events Node](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-10-Add-and-Open-Events-Node.jpg)

**18.** To add a new server, click the pencil icon next to the “`Server`” text box.

![Edit Server Config](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-11-Edit-Server-Config.jpg)

**19.** On this screen, we can finally add your Home Assistant Docker install as a contactable server.

1. First, set the “`Base URL`” (**1.**). This value will be “`http://`” followed by your server’s local IP address, and finally, the port “`:8123`“.

   For example, a valid setting would be “[`http://192.168.0.134:8123`](http://192.168.0.134:8123)“.

2. Next, you must type in the Access Token (**2.**) you generated earlier in this guide. This token is what lets Node-RED talk securely with Home Assistant.

After filling out these two fields, `click` the “Add” button (**3.**).

![Add URL and access token for Home Assistant Docker Compose](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-12-Add-Home-Assistant-to-Node-RED.jpg)

**20.** With the server added, you must click the “`Deploy`” button in the top-right of Node-RED’s web interface.

Your changes won’t be saved until you do this. After deploying, you can safely delete the “`events:all`” node that we added and click the “`Deploy`” button again.

![Deploy Changes to Node-RED](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-13-Deploy-Changes.jpg)

## Adding your MQTT Server to Home Assistant using Docker Compose

**21.** Our final steps of this tutorial will show you how to add the MQTT broker we installed to Home Assistant.

Click the “`Settings`” button in the sidebar to start this process. 

![Open Settings Panel](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-14-Open-Settings-Panel.jpg)

**22.** Now, navigate the settings menu and click the “`Devices & services`” option.

![Open Devices and Services](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-15-Devices-and-Services.jpg)

**23.** Within this screen, you must click the “`+ ADD INTEGRATION`” button in the bottom-right of the screen.

![Add New Integration](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-16-Add-New-Integration.jpg)

**24.** Now, using the search box on this screen, type in “`mqtt`” (**1.**).

You should see “`MQTT`” as the only option (**2.**). Click this integration to continue.

![Begin Adding MQTT to your Home Assistant Docker Compose Installation](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-17-Begin-Adding-MQTT.jpg)

**25.** You will see a list of different MQTT variants you can add. You will want the one at the top of the list labeled “`MQTT`“.

![Choose MQTT Version](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-18-Choose-MQTT-Version.jpg)

**26.** On here you will want to set “`Broker`” to the local IP address of your Home Assistant server (**1.**). For example, in our case we would use “`192.168.0.134`.

After setting the IP address, click the “`Submit`” button (**2.**).

![Add MQTT Broker](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-19-Add-MQTT-Broker.jpg)

**27.** You have successfully set up MQTT on your Home Assistant Docker installation.

![Created Configuration](https://pimylifeup.com/wp-content/uploads/2023/11/Home-Assistant-Docker-Compose-Install-20-Created-Configuration.jpg)

## Conclusion

Hopefully, at this stage, you will have successfully set up Home Assistant on your system using Docker Compose.

Docker lets you easily get Home Assistant up and running with your chosen  operating system. However, it has its drawbacks, as it loses support for add-ons. Addons make adding extra functionality a breeze.

Please feel free to comment below if you have any questions about using Docker Compose to run Home Assistant.

If you found this tutorial helpful, be sure to check out our number of other [Home Assistant tutorials](https://pimylifeup.com/category/home-assistant/).