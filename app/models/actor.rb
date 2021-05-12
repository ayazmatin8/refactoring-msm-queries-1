# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  def characters
    my_id = self.id

    matching_records = Character.where({ :actor_id => my_id })

    return matching_records
  end

  def movies
    my_id = self.id

    matching_records = Character.where({ :actor_id => my_id })

    movie_records = matching_records.map_relation_to_array(:movie_id)

    list_of_movies = Movie.where({ :id => movie_records})
    
    return list_of_movies
  end
end
