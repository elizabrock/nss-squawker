lookup_service = Rails.env.test? ? :test : :freegeoip
Geocoder.configure(
  :ip_lookup => lookup_service
)
