
LN = cp -Rul

Debian: Debian64

firmware-8.4.0-i386-netinst.iso:
	#sudo dnf install -y jigdo
	jigdo-lite 'http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.4.0/i386/jigdo-cd/firmware-8.4.0-i386-netinst.jigdo'
	echo "Checking ISO"
	curl 'http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.4.0/i386/jigdo-cd/SHA256SUMS' | sha256sum -c -

firmware-8.4.0-amd64-netinst.iso:
	#sudo dnf install -y jigdo
	jigdo-lite 'http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.4.0/amd64/jigdo-cd/firmware-8.4.0-amd64-netinst.jigdo'
	echo "Checking ISO"
	curl 'http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/8.4.0/amd64/jigdo-cd/SHA256SUMS' | sha256sum -c -
