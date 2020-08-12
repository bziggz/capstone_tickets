module ApplicationHelper
  def projects_array
    result = []

    Project.all.each do |project|
      result.push([project.name, project.id])
    end

    result
  end

  def format_status(ticket)
    status_hash = { 'new' => 'New',
                  'fixed' => 'Fixed',
                  'in_process' => 'In Process',
                  'blocked' => 'Blocked'
                }

    status_hash[ticket.status]
  end

  def tags_array
    result = []

    Tag.all.each do |tag|
      result.push([tag.name, tag.id])
    end

    result
  end
end
