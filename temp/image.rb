class Image
  attr_accessor :image

  def initialize(image)
    @image = image
    @rows = @image.size
    @cols = @image.first.size
  end

  def blur
    @image_copy = Array.new(@rows) {Array.new(@cols)}
    @image.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        @image_copy[row_index][col_index] = 0
      end
    end

    @image.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if @image[row_index][col_index] == 1
          blur_location(row_index,col_index)
        end
      end
    end
    @image = @image_copy
    return @image
  end

  def blur_location(row,col)
    @image_copy[row][col] = 1
    @image_copy[row][col-1] = 1 unless col.zero?
    @image_copy[row][col+1] = 1 unless col == @cols-1
    @image_copy[row-1][col] = 1 unless row.zero?
    @image_copy[row+1][col] = 1 unless row == @rows-1
  end

end