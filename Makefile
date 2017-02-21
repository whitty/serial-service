.PHONY: install log

install:
	sudo systemctl disable ttyUSBN || true
	sudo cp ttyUSBN.service /lib/systemd/system/
	sudo cp serial.rules /etc/udev/rules.d/90-serial.rules
	sudo udevadm control --reload-rules
	sudo systemctl enable ttyUSBN

log:
	sudo journalctl -u ttyUSBN | cat
