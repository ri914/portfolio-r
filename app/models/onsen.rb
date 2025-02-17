class Onsen < ApplicationRecord
  belongs_to :user
  belongs_to :saved_by_user, class_name: 'User', optional: true
  has_many_attached :images
  has_many :image_descriptions, dependent: :destroy
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
      '北海道'
    when '東北'
      ['北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県']
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
end
