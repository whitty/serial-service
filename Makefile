.PHONY: all dev_test install log

all:
	@echo Nothing to do

dev_test:
	sudo systemctl stop socat@dev-ttyUSB0.service
	sudo cp socat@.service /etc/systemd/system/
	sudo cp serial.rules /etc/udev/rules.d/90-serial.rules
	sudo install -m 0755 -D serial-service /usr/share/serial-service/serial-service
	sudo udevadm control --reload-rules
	sudo systemctl daemon-reload

log:
	sudo journalctl -u socat@dev-ttyUSB0.service | cat

install:
	install -m 0644 -D socat@.service $(DESTDIR)/lib/systemd/system/socat@.service
	install -m 0644 -D serial.rules $(DESTDIR)/lib/udev/rules.d/90-serial.rules
	install -m 0755 -D serial-service $(DESTDIR)/usr/share/serial-service/serial-service
