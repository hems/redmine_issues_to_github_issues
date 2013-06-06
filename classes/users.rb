# TODO: finish mapping users

class Users
  @@users = {
    "Adrian Gierakowski"         => "adrian-gierakowski",
    "Alexander Refsum Jensenius" => "alexarje",
    "Pascal Baltazar"            => "bltzr",
    "Pascal Baltazar"            => "bodsiin",
    "Julien Rabin"               => "jln-",
    "Trond Lossius"              => "lossius",
    "Nils Peters"                => "nilson",
    "Tim Place"                  => "tap",
    "Th?o de la Hogue"           => "theod"
  }

  def self.by_assignee( assignee )
    @@users[assignee]
  end

end