module ApplicationHelper
  def projects_array
    result = []

    Project.all.sort_by(&:name).each do |project|
      result.push([project.name, project.id])
    end

    result
  end

  def tags_array
    result = []

    Tag.all.sort_by(&:name).each do |tag|
      result.push([tag.name, tag.id])
    end
    
    result
  end

  def users_array
    result = [['No One', nil]]

    User.all.sort_by(&:name).each do |user|
      result.push([user.name, user.id])
    end

    result
  end

  def status_array
    [
      ['New', 'new'],
      ['Blocked', 'blocked'],
      ['In Progress', 'in_progress'],
      ['Fixed', 'fixed']
    ]
  end

  def format_status(ticket)
    status_hash = {
      'new' => 'New',
      'fixed' => 'Fixed',
      'in_progress' => 'In Progress',
      'blocked' => 'Blocked'
    }

    status_hash[ticket.status]
  end
end
