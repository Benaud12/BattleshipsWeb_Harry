module Display
  def display_board
    @htmlboard = "<div style='width: 600px'>"
    @grid.each do |key, value|
      if value.content.kind_of? Water
        @htmlboard << "<div style='height: 58px; width: 58px; background-image: url(http://www.fisherboards.com/wp-content/uploads/2014/06/calm-water-311.jpg); float: left; border: 1px dotted red'></div>"
      else
        @htmlboard << "<div style='height: 23px; width: 23px; background-color: yellow; float: left; border: 1px dotted red'></div>"
      end
    end
    @htmlboard << "</div>"
    @htmlboard
  end
end


def display_board(printer_class)
  printer_class.new.display_board
end
