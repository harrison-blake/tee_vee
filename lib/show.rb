class Show
attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    total = 0
    @characters.each do |character|
      total += character.salary
    end

    return total
  end

  def highest_paid_actor
    greatest = characters[0]
    @characters.each do |character|
      if character.salary > greatest.salary
        greatest = character
      end
    end

    return greatest.actor
  end

  def actors
    @characters.map do |character|
      character.actor
    end
  end
end
