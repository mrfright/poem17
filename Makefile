default:
	nasm linux-poem-16.asm -f bin -o linux-poem-16.bin

iso:
	mkisofs -R -b linux-poem-16.bin -no-emul-boot -boot-load-size 4 -o linux-poem-16.iso .

qemu:
	qemu-system-i386 linux-poem-16.bin

test: default qemu
