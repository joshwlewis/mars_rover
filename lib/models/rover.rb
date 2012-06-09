class Rover
  
  #TODO: some type of input validation
  
  def map_size #read map size, prompt if unknown
    @map_size ||= get_input('Enter Map Size: ').split(' ')
  end
  
  def map_size=(ms)
    @map_size = ms.split(' ')
  end
  
  def initial_position #read initial position, prompt if unknown
    @initial_position ||= get_input('Enter Position: ').split(' ')    
  end

  def initial_position=(ip)
    @initial_position = ip.split(' ')
  end
  
  def instructions #read instructions, prompt if unknown
    @instructions ||= get_input('Enter Instructions: ').each_char.map
  end
  
  def instructions=(i)
    @instructions = i.each_char.map
  end
  
  def get_input(prompt)
    print prompt
    gets.strip
  end
  
  @@directions = ['N','E','S', 'W']    
  def self.directions #list of possible directions
    @@directions
  end

  def y #read rover y location
    @y ||= initial_position[1].to_i
  end
  
  def x #read rover x location
    @x ||= initial_position[0].to_i
  end
  
  def dir #read direction rover is pointed
    @dir ||= initial_position[2].to_s
  end

  def l(t) #Turn left t times
    (t || 1).times do
      @dir = Rover.directions.at(dir_index - 1)
    end
  end
  
  def r(t) # Turn right t times
    (t || 1).times do 
      if dir == Rover.directions.last
        @dir = Rover.directions.first
      else
        @dir = Rover.directions.at(dir_index + 1)
      end
    end
  end
  
  def m(t) #Move the rover straight ahead t times
    (t || 1).times do
      if dir == 'N'
        y >= y_max ? @y = y_min : @y += 1
      elsif dir == 'E'
        x >= x_max ? @x = x_min : @x += 1
      elsif dir == 'S'
        y <= y_min ? @y = y_max : @y -= 1
      elsif dir == 'W'
        x <= x_min ? @x = x_max : @x -= 1
      end
    end
  end
  
  def execute #complete the instructions
    instructions.each_with_index do |instruction, index|
      unless instruction.is_numeric?
        puts "I'm at: " + position
        next_instruction = instructions.at(index + 1)
        repeat = next_instruction.to_i if next_instruction and next_instruction.is_numeric? 
        if instruction == 'M'
          m(repeat)
        elsif instruction == 'L'
          l(repeat)
        elsif instruction == 'R'
          r(repeat)
        end
        puts "Moving to: " + position
      end  
    end
  end
    
  def dir_index #index for the compass
    Rover.directions.index(dir)
  end
  
  def y_max #topmost coordinates
    @y_max ||= map_size.last.to_i
  end
  
  def y_min #bottommost coordinates
    0
  end
  
  def x_max #rightmost coordinates
    @x_max ||= map_size.first.to_i
  end
  
  def x_min #leftmost coordinates
    0
  end
  
  def position #proper format output
    x.to_s + " " + y.to_s + " " + dir.to_s  
  end

end


class String
  def is_numeric?
    true if Float(self) rescue false
  end
end
