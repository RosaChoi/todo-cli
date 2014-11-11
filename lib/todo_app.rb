class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output

    @projects = []
    @tasks = []
  end

  def projects
    @projects
  end

  def tasks
    @tasks
  end

  def real_puts message=""
    $stdout.puts message
  end

  def list
    if @projects.length == 0
      puts "Projects:\n  none"
    # elsif @tasks.length == 0
    #   puts "  none"
    else
      puts "Projects:\n  #{projects.join(", ")}"
    end
  end

  def rename
    puts "Please enter the project name to rename:\n"
    project_name = gets.chomp
    projects.delete(project_name)

    puts "Please enter the new project name:\n"
    project_rename = gets.chomp
    @projects << project_rename
  end

  def create
    puts "Please enter the new project name:\n"
    project_name = gets.chomp
    @projects << project_name
  end

  def delete
    puts "Please enter the project name to delete:\n"
    project_name_to_delete = gets.chomp
    projects.delete(project_name_to_delete)
    list
  end

  def edit
    puts "Editing Project: #{projects.join(", ")}"
    puts " 'list' to list tasks"
    puts " 'create' to create a new task"
    puts " 'edit' to edit a task"
    puts " 'complete' to complete a task and remove it from the list"
    puts " 'back' to return to projects"
    puts " 'quit' to quit"
  end

  def back
    menu
  end

  def run
    puts "Welcome"

    def menu
      puts " "
      puts " 'list' to list projects"
      puts " 'create' to create a new project"
      puts " 'rename' to rename a project"
      puts " 'edit' to edit a project"
      puts " 'quit' to quit"
      puts " "
    end
    menu

    user_input = gets.chomp
    menu

    while user_input != "quit" do
      if user_input == "list"
        list
      elsif user_input == "create"
        create
      elsif user_input == "rename"
        rename
      elsif user_input == "delete"
        delete
      elsif user_input == "edit"
        edit
      elsif user_input == "back"
        back
      end
      user_input = gets.chomp
    end
  end


end
