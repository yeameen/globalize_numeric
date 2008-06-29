module GlobalizeNumeric
#  module Locale
#    NUMERIC_LOCALIZE_MAP = {
#      'bn' =>  ["০","১","২","৩","৪","৫","৬","৭","৮","৯"],
#      'hi' => ["०","१","२","३","४","५","६","७","८","९"]
#    }
#
#    def self.localize_numeric(pOriginalString)
#      string_representation = pOriginalString.to_s
#      result_string = nil
#
#      if !language_code.nil? && NUMERIC_LOCALIZE_MAP.include?(language_code)
#        result_string = string_representation.gsub(/\d/){|digit|
#          NUMERIC_LOCALIZE_MAP[Locale.language.code][digit.to_i]
#        }
#      else
#        result_string = string_representation
#      end
#
###   alternate method for doing the conversion
##        for i in (0...string_representation.length)
##          localize_digit = string_representation[i]
##          if string_representation[i] >= ?0 && string_representation[i] <= ?9
##            localize_digit = @@numeric_localize_map[string_representation[i].to_i - ?0]
##          end
##          result_string << localize_digit
##        end
#
#      return result_string
#    end
#  end

  module CoreExtensions
    module Numeric
      def localize_numeric
#        return localize_numeric(self)
        return self.to_s.localize_numeric
      end
      alias :ln :localize_numeric
    end

    module String
#      def localize_numeric
#        return Locale.localize_numeric(self)
#      end

      NUMERIC_LOCALIZE_MAP = {
        'bn' =>  ["০","১","২","৩","৪","৫","৬","৭","৮","৯"],
        'hi' => ["०","१","२","३","४","५","६","७","८","९"],
        'ar' => ["٠", "١","٢","٣","٤","٥","٦","٧","٨","٩"]
      }

      def localize_numeric()
        string_representation = self
        result_string = nil

        if Locale.language && NUMERIC_LOCALIZE_MAP.include?(Locale.language.code)
          result_string = string_representation.gsub(/\d/){|digit|
            NUMERIC_LOCALIZE_MAP[Locale.language.code][digit.to_i]
          }
        else
          result_string = string_representation
        end
      end
      alias :ln :localize_numeric
    end
  end
end