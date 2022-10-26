cask "python@3.9" do
  version "3.9.0"
  sha256 "dadee1d10c1a8ed58bb64ec7409a48c9fe38599791eaaea29303ee59fb95dfeb"

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macosx10.9.pkg"
  name "Python #{version.major_minor}"
  desc "Interpreted, interactive, object-oriented programming language"
  homepage "https://www.python.org"

  conflicts_with formula: "python@#{version.major_minor}"

  pkg "python-#{version}-macosx10.9.pkg",
      choices: [
        {
         'choiceIdentifier' => "org.python.Python.PythonFramework-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 1,
        },
        {
         'choiceIdentifier' => "org.python.Python.PythonApplications-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 0,
        },
        {
         'choiceIdentifier' => "org.python.Python.PythonUnixTools-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 0,
        },
        {
         'choiceIdentifier' => "org.python.Python.PythonDocumentation-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 1,
        },
        {
         'choiceIdentifier' => "org.python.Python.PythonProfileChanges-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 0,
        },
        {
         'choiceIdentifier' => "org.python.Python.PythonInstallPip-#{version.major_minor}",
         'choiceAttribute'  => 'selected',
         'attributeSetting' => 0,
        },
      ]

  binary "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}/bin/2to3-#{version.major_minor}"
  binary "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}/bin/idle#{version.major_minor}"
  binary "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}/bin/pydoc#{version.major_minor}"
  binary "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}/bin/python#{version.major_minor}"
  binary "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}/bin/python#{version.major_minor}-config"

  uninstall pkgutil: "org.python.Python.*-#{version.major_minor}",
            delete: "/Library/Frameworks/Python.framework/Versions/#{version.major_minor}"

  zap trash: "~/Library/Python/#{version.major_minor}"

end
