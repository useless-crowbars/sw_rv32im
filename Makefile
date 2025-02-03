all:
	$(MAKE) -C ./doom_rv32i/src
	$(MAKE) -C ./emu_rv32i/
	cd ./rpi_bootstrap && python piton.py && cd ..
	mkdir -p ./mif_maker_build
	cmake -S ./mif_maker -B ./mif_maker_build
	mkdir -p ./rpi_bootstrap
	cmake -S ./rpi_bootstrap -B ./rpi_bootstrap_build
	$(MAKE) -C ./mif_maker_build
	$(MAKE) -C ./rpi_bootstrap_build

run_emulator:
	./emu_rv32i/emu_rv32i

clean:
	$(MAKE) -C ./doom_rv32i/src clean
	$(MAKE) -C ./emu_rv32i/ clean
	rm -rf ./mif_maker_build
	rm -rf ./rpi_bootstrap_build
	rm -rf ./rpi_bootstrap/buffer.c
