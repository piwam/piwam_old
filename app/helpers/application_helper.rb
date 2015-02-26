module ApplicationHelper

  def creator(obj)
    html = "#{l(obj.created_at)} par "
    html += obj.creator ? link_to(obj.creator, obj.creator) : '<em>Système</em>'
    raw(html)
  end

  def updater(obj)
    raw(obj.updater ? "#{l(obj.updated_at)} par #{link_to(obj.updater, obj.updater)}" : '<em>Aucune mise à jour pour le moment</em>')
  end

end
