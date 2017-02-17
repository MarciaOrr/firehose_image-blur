class Image

  def initialize(image = [])
    @image = image
    @row_blur = []
    @distance = 0
    @no_rows = 0
    @no_cols = 0  
  end   # initialize

  def blur(distance=1)
    @distance = distance
    @no_rows = @image.length
    @no_cols = @image[0].length
    # initialize @row_blur to length
    for i in 0..@no_cols-1
      @row_blur[i] = 0
    end

    @image.each_with_index do |row_array, row|
      # look any value of 1 in this row
      if row_array.include?(1) || @row_blur.include?(1)
        blur_row(row, row_array)
      end
    end   # image loop
  end   # method blur

  def blur_row(pixel_row, row_array)
    update_row_blur(row_array)

    for bit in 0..@no_cols-1
      if @row_blur[bit] > 0
        for i in 0 .. @row_blur[bit]-1
          set_pixel(pixel_row-i,bit) unless @image[pixel_row-i][bit] == 1
        end    
      end   # if value > 0
    end   # @row_blur for loop
    decrement_row_blur
  end   # method blur_row

  def update_row_blur(row_array= [])
    array = @row_blur
    row_array.each_with_index do |value, index|
      if value == 1
        array[index] = @distance + 1 unless array[index] >= @distance+1
        d = @distance
        for i in 1 .. @distance+1
          array[index-i] = d unless index-i < 0 || array[index-i] >= d
          array[index+i] = d unless index+i >= @no_cols || array[index+i] >= d
          d -= 1
        end   # for i loop
      end   # if value
    end   # each_with_index loop
    @row_blur = array
  end   # update_row_blur

  def set_pixel(row,col)
    return if (row < 0 || row >= @no_rows || col < 0 || col >= @no_cols)
    @image[row][col] = 1
  end   # method set_pixel

  def decrement_row_blur
    for j in 0..@row_blur.length-1
      if (@row_blur[j] > 0)
        @row_blur[j] -= 1
      end
    end
  end   # method decrement_row_blur

  def to_s
    retval = ""
       @image.each do |row|
        retval << row.join('   ') << "\n"
      end
      retval << "\n"
    return retval
  end   # method to_s

end   # Class Image

=begin
image1a = Image.new([
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],    
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image1a.to_s)
image1a.blur(3)
printf("\nImage after blur: %s\n", image1a.to_s)

image1b = Image.new([
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],    
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,1]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image1b.to_s)
image1b.blur(3)
printf("\nImage after blur: %s\n", image1b.to_s)
=end

=begin
image2 = Image.new([
  [0,0,0,0],
  [0,0,1,0],
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,0],
  [0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image2.to_s)
image2.blur(1)
printf("\nImage after blur:\n%s\n", image2.to_s)
=end

=begin
image3 = Image.new([
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [1,0,0,0],
  [0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image3.to_s)
image3.blur(1)
printf("\nImage after blur:\n%s\n", image3.to_s)
=end

=begin
image4 = Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image4.to_s)
image4.blur(1)
printf("\nImage after blur:\n%s\n", image4.to_s)
=end

=begin
image5 = Image.new([
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],    
  [0,0,1,0,0,0,1,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image5.to_s)
image5.blur(2)
printf("\nImage after blur\n%s\n", image5.to_s)
=end

=begin
image6 = Image.new([
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],    
  [0,0,0,0,0,0,1,0,0,0],
  [0,0,1,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0]
])
printf("\n\n * * * * * ----- * * * * *\nImage before:\n%s", image6.to_s)
image6.blur(2)
printf("\nImage after blur\n%s\n", image6.to_s)
=end