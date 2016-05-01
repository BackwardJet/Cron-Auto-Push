#!/bin/bash
for filename in log/*.log; do
	filenodash=${filename// /-}
	mv "$filename" $filenodash
done
ls log
