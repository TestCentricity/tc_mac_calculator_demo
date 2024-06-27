module WorldScreens

  #
  # The screen_objects method returns a hash table of your MacOS app's screen objects and associated screen
  # classes to be instantiated by the TestCentricity ScreenManager.
  #
  def screen_objects
    {
      calculator_screen: CalculatorAppScreen,
      about_dialog:      AboutDialogScreen,
      paper_tape_screen: PaperTapeScreen
    }
  end
end


World(WorldScreens)
