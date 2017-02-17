## Image Blur Problem

The Firehose Project. Coding Challenge. Image Blur #3. February 2017. Ruby program to blur a bitmap by the user-provided Manhattan Distance.

This stand-alone program with RSPEC tests blurs a bit-map array the user-specified Manhattan Distance. It does not contain
any input validation to ensure that the user initializes an array and further that the array really is a bit-map.

The blur is optimized to only pass through the array a single time. It does NOT make a copy of the input array, blur the copy,
and paste the copy back into the original array. An array @blur_row is used to determine which bits to blur in each of the
bit maps columns. Basically it is a 'blur up from current' algorithm.

It contains eight tests which include boundary tests at either the bottom right corner of the bitmap or along one edge of
the bitmap. Test include two bits on the same row and one bit on adjacent rows.