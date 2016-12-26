module UserProfiler
  module UserProfiler
    extend ActiveSupport::Concern

    PROFILE = { 'tourist' => Tourist, 'tour_guide' => TourGuide, 
             'translator' => Translator }

    def method_missing(method, *args, &block)
      if method.to_s =~ /^(is|as)_([a-z_]+)\?*$/ && PROFILE.has_key?($2)
        if $1 == "as"
          return act_as(PROFILE[$2])
        else
          return !!act_as(PROFILE[$2])
        end
      else
        super
      end
    end

    def act_as(klass)
      Profile.of_user(self.id).each { |prf| return prf if prf.is_a?(klass) }
      nil
    end

    def is_agency_person? 
      return true if is_tour_guide? || is_translator?
      false
    end

    # def as_tourist
    #   Profile.of_user(self.id).each { |prf| return prf if prf.is_a?(Tourist) }
    #   nil
    # end

    # def as_tour_guide
    #   Profile.of_user(self.id).each { |prf| return prf if prf.is_a?(TourGuide) }
    #   nil
    # end

    # def as_translator
    #   Profile.of_user(self.id).each { |prf| return prf if prf.is_a?(Translator) }
    #   nil
    # end

    # def is_tour_guide?
    #   Profile.of_user(self.id).each { |prf| return true if prf.is_a?(TourGuide) }
    # end

    # def is_translator?
    #   !!as_translator
    # end

    # def is_tourist?
    #   !!as_tourist
    # end
  end
end