require 'test_helper'

class RadioProgramTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  #Przyklad testu modelu
  test "should not save RadioProgram without an author id" do
    radioprogram = RadioProgram.new(:announcement => 'Audycja 1', :name => 'Tytul audycji', :playlist => 'Cos - costam')
    assert !radioprogram.save, "Saved the radioprogram without an author id "
  end
end
