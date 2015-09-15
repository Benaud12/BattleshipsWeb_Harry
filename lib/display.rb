module Display
  def display_board
    @water = ""
    @grid.each do |key, value|
      if value.content.kind_of? Water
        @water << "<div style='height: 10px; width: 10px; background-color: blue'></div>"
      else
        @water << "<div style='height: 10px; width: 10px; background-color: red'></div>"
      end
    end
    @water
  end
end


def display_board(printer_class)
  printer_class.new.display_board
end
