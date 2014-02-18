Geocoder::Lookup::Test.add_stub(
  "50.197.247.249", [
    { 'city'  => 'Nashville',
      'state' => 'Tennessee'
    }])

Geocoder::Lookup::Test.add_stub(
  "160.36.179.25", [
    { 'city'  => 'Knoxville',
      'state' => 'Tennessee'
    }])

Geocoder::Lookup::Test.add_stub("0.0.0.0", [])
