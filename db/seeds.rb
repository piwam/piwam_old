# Statuses
%w[Président Secrétaire Trésorier].each do |status_label|
  Status.create label: status_label
end