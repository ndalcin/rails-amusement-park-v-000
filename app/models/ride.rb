class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    u = self.user
    a = self.attraction
    if !tall_enough?(u,a) && !enough_tickets?(u,a)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough?(u,a)
      "Sorry. You are not tall enough to ride the #{a.name}."
    elsif !enough_tickets?(u,a)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else #take ride
      u.tickets -= a.tickets
      u.happiness += a.happiness_rating
      u.nausea += a.nausea_rating
      u.save
    end
  end

  def tall_enough?(u,a)
    true if u.height >= a.min_height
  end

  def enough_tickets?(u,a)
    true if u.tickets >= a.tickets
  end
end
