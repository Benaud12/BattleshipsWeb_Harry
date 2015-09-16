module PlaceShip
  def place_ship(ship, orientation)
    @ship = ship.to_sym
    @orientation = orientation.to_sym
    unless session[@ship]
      session[@ship] = params[@ship]
      session[@ship] = session[@ship].to_sym if params[@ship] != nil
      @ac_orientation = params[@orientation]
      @ac_orientation = @ac_orientation.to_sym if params[@orientation] != nil
      if session[@ship]
        $player.board.place(Ship.send(@ship), session[@ship], @ac_orientation)
      end
    end
  end
end
