Pod::Spec.new do |s|
  s.name             = 'JKDropDown'
  s.version          = '1.0.2'
  s.summary          = 'Ios Swift-3 lightweight DropDown using tableview'
 
  s.description      = <<-DESC
Ios Swift-3 lightweight DropDown using tableview!
                       DESC
 
  s.homepage         = 'https://github.com/janeshsutharios/JKDropDown/blob/master/README.md'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Janesh suthar' => 'janesh.stack@gmail.com' }
  s.source           = { :git => 'https://github.com/janeshsutharios/JKDropDown.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'JKDropDown/JKDropDown.swift'
 
end