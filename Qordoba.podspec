Pod::Spec.new do |s|
  s.name             = "Qordoba"
  s.version          = "0.0.1"
  s.summary          = <<-SUMMARY
  <p>This SDK was automatically   by Qordoba BETA v2.0 on <#=02/25/2016 #></p>

SUMMARY
  s.homepage         = "http://qordoba.com"
  s.license          = 'MIT'
  s.author           = { "Qordoba" => "support@qordoba.com" }

  s.requires_arc     = true
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.source_files     = 'Qordoba/**/*.{h,m}'

  s.dependency       'Unirest' , '~> 1.1.2'
  s.dependency       'JSONModel'
end
