module ApplicationHelper
  def projects_array
    result = []

    Project.all.each do |project|
      result.push([project.name, project.id])
    end

    result
  end
end
