import subprocess

average_time = 0
counter = 0

for i in range(0,1000):
	process = subprocess.Popen(['qemu-arm', 'decoder.exe'], stdout=subprocess.PIPE)
	out, err = process.communicate()
	average_time = average_time + float(out.split('\n')[3].split(' ')[-1])
	counter = counter+1

print counter
print average_time/counter