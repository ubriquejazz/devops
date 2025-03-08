# Virtualizacion

## Red modo user 

    Proxy: 10.0.2.2
    MV: 10.0.2.15
    10.0.2.0/24 (virtual net)
    MFx: 192.168.0.0/21

## Red modo bridge 

    Proxy: 192.168.123.1
    MV1: .100
    MV2: .101
    192.168.123.0/24 (virtual net)

    MFx: 172.16.1.0/24 (wifi pepi)
    MFx: 192.168.0.0/21 (andared)
    
## Comandos

    getenv passwd

    virsh list --all

    virsh dumpxml guest1 > guest1.xml

    virsh undefine –domain guest1 –remove-all-storage
