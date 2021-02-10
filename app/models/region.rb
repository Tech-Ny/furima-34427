class Region < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '大阪' },
    { id: 3, name: '兵庫' },
    { id: 4, name: '三重' },
    { id: 5, name: '滋賀' },
    { id: 6, name: '奈良' },
    { id: 7, name: '和歌山' },
    { id: 8, name: '京都' }
  ]

  include ActiveHash::Associations
  has_many :items
end
