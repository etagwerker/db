require 'pry'
require 'minitest/spec'
require 'minitest/autorun'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'diffbot'

class TestDiffbot < MiniTest::Unit::TestCase
  
  describe "when hitting the Diffbot API" do
    before do
      @client = Diffbot::Client.new( { token: "a285e9eb122e8b62600b3776d4abd632" } )
    end

    describe "Op3nVoice::Client" do
      describe "#article" do
        it "should return semantic data about the article" do
          response = @client.article('http://www.ombushop.com/blog/tu-tienda-online/mantenimiento-de-dinero-mail-payu.html')
          assert response.title == "Mantenimiento de Dinero Mail by PayU"
        end
      end
    end
  end
  
end
