
#
# Testing Ruote
#
# Fri Jul 31 09:50:13 JST 2009
#

require File.dirname(__FILE__) + '/../test_helper.rb'

require 'ruote/parser/xml'


class RubyParserTest < Test::Unit::TestCase

  def test_sequence

    tree = Ruote::XmlParser.parse(%{
<define name="nada">
  <sequence>
    <alpha/>
    <bravo/>
  </sequence>
</define>
    })

    assert_equal(
      ["define", {"name"=>"nada"}, [
        ["sequence", {}, [["alpha", {}, []], ["bravo", {}, []]]]
      ]],
      tree)
  end

  def test_echo

    tree = Ruote::XmlParser.parse(%{
<process-definition name="nada">
  <echo>la vida loca</echo>
</process-definition>
    })

    assert_equal(
      ["process_definition", {"name"=>"nada"}, [["echo", {"la vida loca"=>nil}, []]]],
      tree)
  end
end

