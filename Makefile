.PHONY: install log

install:
	sudo systemctl stop socat@dev-ttyUSB0.service
	sudo cp socat@.service /etc/systemd/system/
	sudo cp serial.rules /etc/udev/rules.d/90-serial.rules
	sudo install -m 0755 -t /usr/share/serial-service serial-service
	sudo udevadm control --reload-rules
	sudo systemctl daemon-reload

log:
	sudo journalctl -u socat@dev-ttyUSB0.service | cat
