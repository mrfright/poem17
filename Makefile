default:
	nasm linux-poem-17.asm -f bin -o linux-poem-17.bin

iso:
	mkisofs -R -b linux-poem-17.bin -no-emul-boot -boot-load-size 4 -o linux-poem-17.iso .

qemu:
	qemu-system-i386 linux-poem-17.bin

test: default qemu
