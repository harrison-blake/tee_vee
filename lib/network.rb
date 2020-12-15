class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def main_characters
    m_characters = []
    @shows.each do |show|
      show.characters.each do |character|
        m_characters.push(character)
      end
    end

    return m_characters
  end

  def actors_by_show
    actors_by_show = {}
    @shows.each do |show|
      actors_by_show[show] = show.actors
    end

    return actors_by_show
  end

  def shows_by_actor
    uniq_actors = get_uniq_actors
    shows_by_actor = {}

    uniq_actors.each do |actor|
      shows = []
      @shows.each do |show|
        if show.actors.include?(actor)
          shows.push(show)
        end
      end
      shows_by_actor[actor] = shows
    end

    return shows_by_actor
  end

  def prolific_actors
    prolific_actors = []
    shows_by_actor.each do |actor, shows|
      if shows.length > 1
        prolific_actors.push(actor)
      end
    end

    return prolific_actors
  end

  def get_uniq_actors
    actors = []
    @shows.each do |show|
      actors += show.actors
    end

    actors = actors.uniq
    return actors
  end
end
