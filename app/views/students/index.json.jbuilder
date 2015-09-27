json.array!(@students) do |student|
  json.extract! student, :id, :name, :email, :p_hash
  json.url student_url(student, format: :json)
end
