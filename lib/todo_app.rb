class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output

    @projects = []
    @tasks =[]
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
    else
      puts "Projects:\n  #{projects.join("\n  ")}"
    end
  end

  def tasks_list
    if @tasks.length == 0
      puts "  none"
    else
      puts "#{tasks.join("\n")}"
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

  def tasks_create
    puts "Please enter a new task:\n"
    task_name = gets.chomp
    @tasks << task_name
  end

  def delete
    puts "Please enter the project name to delete:\n"
    project_name_to_delete = gets.chomp
    projects.delete(project_name_to_delete)
    list
  end

  def menu
    puts "\n"
    puts "Please enter:"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'rename' to rename a project"
    puts "'edit' to edit a project"
    puts "'quit' to quit"
    puts "\n"
  end

  def submenu
    puts "\n"
    puts " 'list' to list tasks"
    puts " 'create' to create a new task"
    puts " 'edit' to edit a task"
    puts " 'complete' to complete a task and remove it from the list"
    puts " 'back' to return to projects"
    puts " 'quit' to quit"
    puts "\n"
  end

  def tasks_edit
    puts "Please enter the task to update:\n"
    task_to_update = gets.chomp

    if @tasks.include?(task_to_update)
      tasks.delete(task_to_update)
      puts "Please enter the new task:\n"
      task_updated = gets.chomp
      @tasks << task_updated
    elsif
      @tasks != task_to_update
      puts "task not found: 'not here'"
      back
    end
  end

  def tasks_complete
    puts "Please enter the completed task:\n"
    task_completed = gets.chomp

    if @tasks.include?(task_completed)
      puts task_completed + ": completed"
    else
      puts "task not found: 'not here'"
    end
  end

  def edit

    if @project == 1
      puts "Editing Project: #{projects.join("\n  ")}"
    else
      puts "Please enter the project name to edit:\n"
      project_to_edit = gets.chomp
      puts "Editing Project: " + project_to_edit
    end

    submenu

    editing = true

    while editing
      user_input = gets.chomp

      if user_input == 'back'
        back
      elsif user_input == "list"
        tasks_list
      elsif user_input == "create"
        tasks_create
      elsif user_input == "edit"
        tasks_edit
      elsif user_input == "complete"
        tasks_complete
      elsif user_input == 'quit'
        editing = false
        @running = false
      end
    end

  end

  def back
    menu
  end

  def run
    puts "Welcome to the TODO App"

    menu

    @running = true

    while @running
      user_input = gets.chomp

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
      elsif user_input == "quit"
        @running = false
      end
    end

  end

end
