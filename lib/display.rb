module Display
  def display_board
    @htmlboard = "<div style='width: 600px; height: 600px; background-image: url(http://media.giphy.com/media/JXHhI4o9NCf8k/giphy.gif)'>"
    @grid.each do |key, value|
      if value.content.kind_of? Water
        @htmlboard << "<div id='water'></div>"
      else
        @htmlboard << "<div style='height: 58px; width: 58px; background-color: yellow; float: left; border: 1px dotted red'></div>"
      end
    end
    @htmlboard << "</div>"
    @htmlboard
  end
end


# def display_board(printer_class)
#   printer_class.new.display_board
# end
