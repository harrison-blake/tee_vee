require './lib/character'
require './lib/show'
require './lib/network'
require 'minitest/autorun'
require 'minitest/pride'

class Networktest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_network_has_attributes
    nbc = Network.new("NBC")

    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_network_has_shows
    nbc = Network.new("NBC")
    nbc.add_show(@knight_rider)
    nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], nbc.shows
  end

  def test_networks_main_characters
    nbc = Network.new("NBC")
    nbc.add_show(@knight_rider)
    nbc.add_show(@parks_and_rec)

    assert_equal [@michael_knight, @kitt, @leslie_knope, @ron_swanson], nbc.main_characters
  end

  def test_actors_by_show
    nbc = Network.new("NBC")
    nbc.add_show(@knight_rider)
    nbc.add_show(@parks_and_rec)

    actors_by_show = {
                      @knight_rider => ["David Hasselhoff", "William Daniels"],
                      @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
                     }

    assert_equal actors_by_show, nbc.actors_by_show
  end

  def test_shows_by_actor
    nbc = Network.new("NBC")
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])
    nbc.add_show(@knight_rider)
    nbc.add_show(baywatch)
    nbc.add_show(@parks_and_rec)

    shows_by_actor =  {
                       "David Hasselhoff" => [@knight_rider, baywatch],
                       "William Daniels" => [@knight_rider],
                       "Amy Poehler" => [@parks_and_rec],
                       "Nick Offerman" => [@parks_and_rec]
                      }

    assert_equal shows_by_actor, nbc.shows_by_actor
  end

  def test_has_prolific_actors
    nbc = Network.new("NBC")
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])
    nbc.add_show(@knight_rider)
    nbc.add_show(baywatch)
    nbc.add_show(@parks_and_rec)

    assert_equal ["David Hasselhoff"], nbc.prolific_actors
  end
end
