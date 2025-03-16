class Onsen < ApplicationRecord
  belongs_to :user
  belongs_to :saved_by_user, class_name: 'User', optional: true
  has_many_attached :images
  has_many :image_descriptions, dependent: :destroy
  has_many :saved_onsens, dependent: :destroy
  has_many :users, through: :saved_onsens
  has_and_belongs_to_many :water_qualities

  validates :name, presence: true

  def self.prefectures
    [
      ['北海道', '北海道'],
      ['青森県', '青森県'],
      ['岩手県', '岩手県'],
      ['宮城県', '宮城県'],
      ['秋田県', '秋田県'],
      ['山形県', '山形県'],
      ['福島県', '福島県'],
      ['茨城県', '茨城県'],
      ['栃木県', '栃木県'],
      ['群馬県', '群馬県'],
      ['埼玉県', '埼玉県'],
      ['千葉県', '千葉県'],
      ['東京都', '東京都'],
      ['神奈川県', '神奈川県'],
      ['新潟県', '新潟県'],
      ['富山県', '富山県'],
      ['石川県', '石川県'],
      ['福井県', '福井県'],
      ['山梨県', '山梨県'],
      ['長野県', '長野県'],
      ['岐阜県', '岐阜県'],
      ['静岡県', '静岡県'],
      ['愛知県', '愛知県'],
      ['三重県', '三重県'],
      ['滋賀県', '滋賀県'],
      ['京都府', '京都府'],
      ['大阪府', '大阪府'],
      ['兵庫県', '兵庫県'],
      ['奈良県', '奈良県'],
      ['和歌山県', '和歌山県'],
      ['鳥取県', '鳥取県'],
      ['島根県', '島根県'],
      ['岡山県', '岡山県'],
      ['広島県', '広島県'],
      ['山口県', '山口県'],
      ['徳島県', '徳島県'],
      ['香川県', '香川県'],
      ['愛媛県', '愛媛県'],
      ['高知県', '高知県'],
      ['福岡県', '福岡県'],
      ['佐賀県', '佐賀県'],
      ['長崎県', '長崎県'],
      ['熊本県', '熊本県'],
      ['大分県', '大分県'],
      ['宮崎県', '宮崎県'],
      ['鹿児島県', '鹿児島県'],
      ['沖縄県', '沖縄県'],
    ]
  end

  def region
    case location
    when '北海道'
      '北海道'
    when '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県'
      '東北'
    when '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県'
      '関東'
    when '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県'
      '中部'
    when '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県'
      '近畿'
    when '鳥取県', '島根県', '岡山県', '広島県', '山口県'
      '中国'
    when '徳島県', '香川県', '愛媛県', '高知県'
      '四国'
    when '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県'
      '九州・沖縄'
    else
      '不明'
    end
  end

  def self.region_locations(region)
    case region
    when '北海道'
      ['北海道']
    when '東北'
      ['青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県']
    when '関東'
      ['茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県']
    when '中部'
      ['新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県']
    when '近畿'
      ['三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県']
    when '中国'
      ['鳥取県', '島根県', '岡山県', '広島県', '山口県']
    when '四国'
      ['徳島県', '香川県', '愛媛県', '高知県']
    when '九州・沖縄'
      ['福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']
    else
      []
    end
  end

  def self.region_order
    {
      '北海道' => 0,
      '東北' => 1,
      '関東' => 2,
      '中部' => 3,
      '近畿' => 4,
      '中国' => 5,
      '四国' => 6,
      '九州・沖縄' => 7,
    }
  end

  def self.prefecture_order
    {
      '北海道' => 0,
      '青森県' => 1,
      '岩手県' => 2,
      '宮城県' => 3,
      '秋田県' => 4,
      '山形県' => 5,
      '福島県' => 6,
      '茨城県' => 7,
      '栃木県' => 8,
      '群馬県' => 9,
      '埼玉県' => 10,
      '千葉県' => 11,
      '東京都' => 12,
      '神奈川県' => 13,
      '新潟県' => 14,
      '富山県' => 15,
      '石川県' => 16,
      '福井県' => 17,
      '山梨県' => 18,
      '長野県' => 19,
      '岐阜県' => 20,
      '静岡県' => 21,
      '愛知県' => 22,
      '三重県' => 23,
      '滋賀県' => 24,
      '京都府' => 25,
      '大阪府' => 26,
      '兵庫県' => 27,
      '奈良県' => 28,
      '和歌山県' => 29,
      '鳥取県' => 30,
      '島根県' => 31,
      '岡山県' => 32,
      '広島県' => 33,
      '山口県' => 34,
      '徳島県' => 35,
      '香川県' => 36,
      '愛媛県' => 37,
      '高知県' => 38,
      '福岡県' => 39,
      '佐賀県' => 40,
      '長崎県' => 41,
      '熊本県' => 42,
      '大分県' => 43,
      '宮崎県' => 44,
      '鹿児島県' => 45,
      '沖縄県' => 46,
    }
  end
end
