//
//  MovieSearchTableViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/07/20.
//

import UIKit

class MovieSearchTableViewController: UITableViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var searchIconImg: UIImageView!
    
    @IBOutlet weak var searchView: UIView!
    
    var movieList = [movie0, movie1, movie2, movie3, movie4, movie5, movie6, movie7]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 120
        tableView.backgroundColor = .black
        
        designSearchArea()
    }
    
    func designSearchArea() {
        //UIView
        searchView.frame.size.height = 68
        searchView.backgroundColor = .darkGray
        
        //UIButton Left
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.setTitle("", for: .normal)
        closeButton.tintColor = .white
        
        //UIButton Right
        eraseButton.setImage(UIImage(systemName: "xmark.octagon.fill"), for: .normal)
        eraseButton.setTitle("", for: .normal)
        eraseButton.tintColor = .systemGray3
        
        //UITextField
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .systemGray
        searchTextField.textColor = .white
        searchTextField.layer.cornerRadius = 8
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: searchTextField.frame.height))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
        searchTextField.rightView = paddingView
        searchTextField.rightViewMode = .always
        
        //UIImageView
        searchIconImg.image = UIImage(systemName: "magnifyingglass")
        searchIconImg.tintColor = .systemGray3
    }
    
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEraseButton(_ sender: UIButton) {
        searchTextField.text = ""
    }
    
    @IBAction func returnSearchTextField(_ sender: UITextField) {
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieSearchTableViewCell", for: indexPath) as! MovieSearchTableViewCell
        
        cell.backgroundColor = .black
        
        cell.movieImg.image = UIImage(named: movieList[indexPath.row].posterImageName)
        cell.movieImg.contentMode = .scaleAspectFill
        
        cell.movieTitle.text = movieList[indexPath.row].title
        cell.movieTitle.textColor = .white
        cell.movieTitle.font = .boldSystemFont(ofSize: 16)
        
        cell.movieLuanchDate.text = movieList[indexPath.row].releaseDate
        cell.movieLuanchDate.textColor = .white
        cell.movieLuanchDate.font = .systemFont(ofSize: 16)
        
        cell.movieContent.text = movieList[indexPath.row].plot
        cell.movieContent.textColor = .systemGray
        cell.movieContent.font = .systemFont(ofSize: 12)
        cell.movieContent.numberOfLines = 0
        
        return cell
    }
    
    
    
}

struct Movie {
    var title: String
    var releaseDate: String
    var plot: String
    var posterImageName: String
}

var movie0 = Movie(title: "해리포터와 마법사의 돌", releaseDate: "2001. 12. 14.", plot: "해리 포터(다니엘 래드클리프 분)는 위압적인 버논 숙부(리챠드 그리피스 분)와 냉담한 이모 페투니아 (피오나 쇼 분), 욕심 많고 버릇없는 사촌 더즐리(해리 멜링 분) 밑에서 갖은 구박을 견디며 계단 밑 벽장에서 생활한다. 이모네 식구들 역시 해리와의 동거가 불편하기는 마찬가지. 이모 페투니아에겐 해리가 이상한(?) 언니 부부에 관한 기억을 떠올리게 만드는 달갑지 않은 존재다. 11살 생일이 며칠 앞으로 다가왔지만 한번도 생일파티를 치르거나 제대로 된 생일선물을 받아 본 적이 없는 해리로서는 특별히 신날 것도 기대 할 것도 없다. 11살 생일을 며칠 앞둔 어느 날 해리에게 초록색 잉크로 쓰여진 한 통의 편지가 배달된다. 그 편지의 내용은 다름 아닌 해리의 11살 생일을 맞이하여 전설적인“호그와트 마법학교”에서 보낸 입학초대장이었다. 그리고 해리의 생일을 축하하러 온 거인 해그리드는 해리가 모르고 있었던 해리의 진정한 정체를 알려주는데. 그것은 바로 해리가 굉장한 능력을 지닌 마법사라는 것! 해리는 해그리드의 지시대로 자신을 구박하던 이모네 집을 주저없이 떠나 호그와트행을 택한다. 런던의 킹스크로스 역에 있는 비밀의 9와 3/4 승장장에서 호그와트 특급열차를 탄 해리는 열차 안에서 같은 호그와트 마법학교 입학생인 헤르미온느 그레인저(엠마 왓슨 분)와 론 위즐리 (루퍼트 그린트 분)를 만나 친구가 된다. 이들과 함께 호그와트에 입학한 해리는, 놀라운 모험의 세계를 경험하며 갖가지 신기한 마법들을 배워 나간다. 또한 빗자루를 타고 공중을 날아다니며 경기하는 스릴 만점의 퀴디치 게임에서 스타로 탄생하게 되며, 용, 머리가 셋 달린 개, 유니콘, 켄타우루스, 히포그리프(말 몸에 독수리 머리와 날개를 가진 괴물)등 신비한 동물들과 마주치며 모험을 즐긴다. 그러던 어느 날 해리는 호그와트 지하실에 `영원한 생을 가져다주는 마법사의 돌'이 비밀리에 보관되어 있다는 것을 알게되고, 해리의 부모님을 죽인 볼드모트가 그 돌을 노린다는 사실도 알게 된다. 볼드모트는 바로 해리를 죽이려다 실패하고 이마에 번개모양의 흉터를 남긴 장본인이다. 해리는 볼드모트로부터 마법의 돌과 호그와트 마법학교를 지키기 위해 필사의 노력을 하는데...", posterImageName: "HarryPotter1")

var movie1 = Movie(title: "해리 포터와 비밀의 방", releaseDate: "2002. 12. 13.", plot: "해리 포터에겐 이번 여름방학이 별로 즐겁질 못했다. 마법이라면 질색을 하는 페투니아 이모(피오나 쇼 분)와 버논 이모부(리차드 그리피스 분)의 구박도 그렇지만, 무엇보다 속상한 건 단짝이었던 론 위즐리(루퍼트 그린트 분)와 헤르미온느 그레인저(엠마 왓슨 분)가 그 사이 자신을 까맣게 잊었는지 자신의 편지에 답장 한 통 없다는 것.\n 그러던 어느날 꼬마 집요정 도비가 해리의 침실에 나타나 뜻밖의 얘기를 한다. 호그와트 마법학교로 돌아가면 무서운 일을 당할 거라는 것. 도비는 해리를 학교에 못 가게 하려고 자신이 여태까지 론과 헤르미온느의 답장을 가로채 왔음을 고백한다. 그러나 도비와 더즐리 가족의 방해에도 불구, 해리는 론과 그의 형제들이 타고 온 하늘을 나는 자동차를 타고 이모집을 탈출, 따뜻한 가족애가 넘치는 론 위즐리의 집으로 간다.\n 개학을 앞두고 학교에 가는 날, 론과 해리는 뭔가의 방해로 9와 3/4 승강장에 못 들어가는 바람에 개학식에 지각할 위기에 처한다. 결국 하늘을 나는 자동차 포드 앵글리아를 타고 천신만고끝에 학교에 도착했으나 공교롭게도 차가 학교 선생님들이 소중히 여기는 '커다란 버드나무' 위에 불시착하는 바람에 화가 난 스네이프 교수로부터 퇴학 경고를 받게 된다. 한편 1학년 때 해리가 보여준 영웅적인 활약상은 학교 전체에 소문이 나고, 그 덕에 해리는 원치 않는 관심의 초점이 된다. 론의 여동생 지니, 사진작가 지망생 콜린 크리비 등의 신입생과 어둠의 마법 방어술을 가르치는 신임 교수 질데로이 록허트가 새롭게 해리포터의 팬이 된다.\n 남의 시선 끌기를 좋아하는 잘난척하는 성격 탓에 주변에서 따돌림 당하는 록허트 교수는 해리와 친해지고 싶어 안달하지만, 그 역시 학교에서 일어나는 무서운 사건에 대해 뾰족한 설명을 못해준다. 모든 이목은 해리에게 집중되고, 결국 급우들은 해리를 의심하기에 이른다. 물론 론과 헤르미온느, 그리고 수수께끼의 일기장에 마음을 뺏긴 론의 동생 지니만은 끝까지 해리를 믿는다.\n 자신을 믿는 친구들을 실망시킬 수는 없는 법. 해리는 -도움을 준다며 되려 걸리적 대는 록허트 교수가 다소 방해가 되긴 하지만- 어둠의 세력과 맞서 싸울 결심을 하는데..", posterImageName: "HarryPotter2")

var movie2 = Movie(title: "해리 포터와 아즈카반의 죄수", releaseDate: "2004. 07. 16.", plot: "13세가 된 ‘해리 포터(다니엘 래드클래프)’는 아버지의 험담을 하는 이모부의 누이 마지 아줌마를 거대한 괴물 풍선으로 만들어 버리고 만다. 일반 세상에서 마법 사용이 금지되어 있는 법을 어긴 해리는 마법부의 징계가 두려워 도망을 치다가 만나게 된 마법부 장관은 ‘시리우스 블랙’(게리 올드만)이 아즈카반의 감옥을 탈출해 해리를 찾고 있다는 소식을 전한다. 시리우스 블랙은 어둠의 마왕인 볼드모트 경을 해리의 부모님에게 이끌어 죽음으로 몰고 간 당사자. 설상가상으로 영혼을 빨아들이는 아즈카반의 무시무시한 간수 ‘디멘터’가 호그와트에 머물며 해리를 위협한다. 그러나 새로 부임한 어둠의 마법 방어술 교수 ‘루핀’(데이빗 튤리스)이 가르쳐준 '패트로누스' 마법으로 해리는 디멘터에게 대적할 힘을 얻는다. 시리우스 블랙과의 불가피한 대결은 다가오고, 해리는 자신과 시리우스 블랙 사이에 얽혀있는 엄청난 비밀을 직면하게 되는데…. 해리를 위협하는 어둠의 세력, 그에 맞서는 해리의 활약! 놀라움으로 가득한 마법의 세계가 다시 펼쳐진다!", posterImageName: "HarryPotter3")

var movie3 = Movie(title: "해리 포터와 불의 잔", releaseDate: "2005. 12. 01.", plot: "해리 포터 일생일대 최대 난관! 요즘 들어 매일 꾸는 악몽 때문에 이마의 상처에 더욱 통증을 느끼는 해리(다니엘 래드클래프)는 친구 론(루퍼트 그린트)과 헤르미온느(엠마 왓슨)와 함께 퀴디치 월드컵에 참가해 악몽에서 벗어날 수 있게 돼 마냥 기쁘다. 그러나 퀴디치 캠프장 근방 하늘에 불길한 기운, 바로 마왕 볼드모트의 상징인 '어둠의 표식'이 나타난다. 볼드모트가 13년 전에 자취를 감춘 뒤 감히 모습을 드러내지 못했던 그의 추종자 데스 이터들이 그 표식을 불러낸 것이다. 두려움으로 가득 찬 해리는 안전한 호그와트 마법학교로 돌아가고 싶어한다. 덤블도어 교장(마이클 갬본 경)이라면 자신을 지켜줄 수 있을 것이기에…. 최강의 챔피언을 찾아라! 트리위저드 마법경연대회! 그러나 올해는 예년과 상황이 좀 다르다. 덤블도어 교장은 유럽의 세 개 명문 마법학교의 결속을 다지기 위해 그간 중단됐던 호그와트에서 '트리위저드 대회'를 개최한다고 발표한다. 트리위저드 대회는 마법의 최고 명문 3개 학교에서 선발된 챔피언 한 명씩 출전해 트리위저드 컵을 놓고 목숨을 건 경합을 벌이는 마법사들 세계에서 가장 흥미진진하고 위험한 마법경연대회. 마법의 '불의 잔'이 각 학교 출전자를 선발하는 의식이 열리고 현란한 불꽃의 축제 속에 불의 잔은 마침내 세 학생의 이름을 호명한다. 강인한 불가리아 덤스트랭 학교의 퀴디치 경기 슈퍼스타인 빅터 크룸(스타니슬라브 이아네브스키)과 우아한 보바통 마법아카데미의 플뢰르 델라쿠르(클레멘스 포에시), 그리고 호그와트의 최고 인기남 케드릭 디고리(로버트 패틴슨). 그러나 세 명의 이름이 다 호명된 후, 뜻밖에도 불의 잔은 또 한 명의 이름을 내뱉는다. 바로 '해리포터'! 피할 수 없는 숙명의 대결! 그러나 해리는 시합 출전자의 나이 제한인 17세보다 세 살이나 어린 14세. 게다가 불의 잔 속에 자신의 이름을 넣은 적이 없다며 거부하지만 불의 잔의 단호한 뜻에 따라 어쩔 수 없이 출전하게 된다. 이 일로 해리에겐 의혹과 시기의 시선이 집중되고 추문 폭로기사 전문기자 리타 스키터는 해리에 대한 모함성 기사를 써서 이를 더욱 부채질한다. 친구 론마저도 해리가 유명해지고 싶어서 불의 잔을 조작했다고 믿기 시작한다. 해리를 위험에 처한 누군가의 음모라고 생각한 덤블도어 교장은 신임 '어둠의 마법 방어술' 교수 '매드아이 무디'(브랜든 글리슨)에게 해리를 잘 지키라고 지시한다. 해리는 트리위저드 대회의 불 뿜는 용 피하기, 거대한 호수 깊이 잠수하기, 살아있는 미로를 빠져 나오기라는 세가지 과제에 대비한 마법 훈련에 돌입한다. 그러나 그보다 해리에게 더 힘든 숙제는 크리스마스 무도회에 함께 참석할 파트너를 구하는 문제다. 해리에겐 용이나 인어, 그라인딜로우와 싸우는 편이 사랑스러운 여학생 초 챙(케이티 렁)에게 무도회의 파트너가 돼달라고 부탁하는 것보다 훨씬 쉬운 일. 한편 론은 헤르미온느에 대한 자신의 감정이 예전과 다르다는 걸 미처 깨닫지 못하고… 불의 잔을 향한 최강의 스펙터클이 펼쳐진다! 그러던 중 호그와트 교정에서 누군가 살해되면서 상황은 급변한다. 볼드모트의 악몽으로 두려움에 휩싸인 해리는 덤블도어를 찾아가지만 그 역시도 뚜렷한 해답을 제시하지 못한다. 경기가 진행되고 해리와 다른 출전자들이 마지막 과제를 풀기 위해 안간힘을 쓰고 있을 때 무언가가 계속 이들을 주시한다. 승리가 목전에 다가온 그 순간, 이제까지의 모든 진실이 밝혀지고 해리포터에게는 진정한 악과의 피할 수 없는 대결이 기다리고 있는데….", posterImageName: "HarryPotter4")

var movie4 = Movie(title: "해리 포터와 불사조 기사단", releaseDate: "2007. 07. 11.", plot: "길고도 지루한 여름 날 호그와트 마법학교 다섯 번째 해를 기다리고 있는 해리포터(다니엘 래드클리프). 이모부 더즐리 식구들과 참고 사는 것도 지겨운데다 친구 론(루퍼트 그린트)과 헤르미온느(엠마 왓슨)에게서는 편지 한 통 오지 않는다. 그러던 중 예상치 못했던 편지 한 장이 도착한다. 그것은 해리가 학교 밖인 리틀 위닝에서 얄미운 사촌 두들리, 즉 머글 앞에서 디멘터들의 공격을 막는 마법을 사용했기 때문에 호그와트 마법학교에서 퇴학 당하게 되었다는 소식이었다. 앞이 캄캄한 해리. 갑자기 어둠의 마법사 오러들이 나타나 해리를 불사조 기사단의 비밀 장소로 데리고 간다. 시리우스(게리 올드만)를 위시한 불사조 기사단을 만난 해리는 과거, 부모님들의 활약상을 알게 되어 힘을 얻고, 자신을 퇴학시키기 위해 마법부 장관 코넬리우스 퍼지(로버트 하디)가 법정에 세우지만 덤블도어 교장(마이클 갬볼 경)의 중재 덕분에 무죄 판결까지 받는다. 하지만 예언자 일보는 볼드모트(랄프 파인즈)가 돌아왔다는 해리의 말이 새빨간 거짓말이라며 비난하고 학생들 역시 해리를 의심하며 따돌린다. 게다가 자신이 가장 힘들어 할 때 도움을 주던 덤블도어 교장까지도 이유 없이 해리를 멀리하고…. 한편, 덤블도어도 못마땅한데 해리의 퇴학마저 무산이 되자 마법부 장관은 ‘어둠의 마법방어술’ 과목에 돌로레스 엄브릿지(이멜다 스털톤)를 교수로 임명한다. 하지만 엄브릿지의 마법방어술 수업은 학생들이 어둠의 힘으로부터 스스로를 지켜내기는커녕 오히려 곤경에 빠지게 한다. 이에 헤르미온느와 론은 해리의 능력을 믿고 자칭 ‘덤블도어의 군대’라고 명명한 비밀단체를 조직한다. 해리는 어둠의 마법에 맞서 스스로를 지켜낼 수 있는 방법을 학생들에게 가르쳐주며 앞으로 닥칠 격전에 대비시킨다. 그러나 밤마다 불길한 사건을 예견하는 악몽에 시달리는 해리. 이제 볼드모트와의 대결이 머지 않았음을 느끼게 된다. 시리우스가 공격 당하는 악몽을 꾼 해리는 덤블도어 군대와 함께 마법부 미스터리 부서 예언의 방으로 향한다. 그리고 이어 나타난 죽음을 먹는 자들…. 빛의 마법과 어둠의 마법간의 불꽃 튀는 대결 해리포터와 불사조 기사단, 호그와트의 운명이 그들에게 달렸다!", posterImageName: "HarryPotter5")

var movie5 = Movie(title: "해리 포터와 혼혈 왕자", releaseDate: "2009. 07. 15.", plot: "어둠의 세력이 더욱 강력해져 머글 세계와 호그와트까지 위협해온다. 위험한 기운을 감지한 덤블도어 교수는 다가올 전투에 대비하기 위해 해리 포터와 함께 대장정의 길을 나선다. 볼드모트를 물리칠 수 있는 유일한 단서이자 그의 영혼을 나누어 놓은 7개의 호크룩스를 파괴하는 미션을 수행해야만 하는 것! 또한 덤블도어 교수는 호크룩스를 찾는 기억여행에 결정적 도움을 줄 슬러그혼 교수를 호그와트로 초청한다. 한편 학교에서는 계속된 수업과 함께 로맨스의 기운도 무르익는다. 해리는 자신도 모르게 지니에게 점점 끌리게 되고, 새로운 여자 친구가 생긴 론에게 헤르미온느는 묘한 질투심을 느끼는데... 남겨진 결전을 위한 최후의 미션, 볼드모트와 해리 포터에 얽힌 치명적인 비밀, 선택된 자만이 통과할 수 있는 대단원을 향한 본격적인 대결이 시작된다!", posterImageName: "HarryPotter6")

var movie6 = Movie(title: "해리 포터와 죽음의 성물 - 1부", releaseDate: "2010. 12. 15.", plot: "덤블도어 교장의 죽음 이후, 마법부는 죽음을 먹는 자들에게 점령당하고 호그와트는 위기에 빠진다. 이에 해리와 론, 헤르미온느는 볼드모트를 물리칠 수 있는 유일한 단서이자 그의 영혼이 담긴 ‘성물’ 호크룩스를 찾기 위한 위험한 여정에 나선다. 그러나 영혼이 연결되어 있는 볼드모트와 해리. 볼드모트를 파괴하면 해리의 목숨 또한 위태로워질지 모른다! 죽느냐 죽이느냐, 이제 그 마지막 대결은 극한을 향해 치닫는데…", posterImageName: "HarryPotter7")

var movie7 = Movie(title: "해리 포터와 죽음의 성물 - 2부", releaseDate: "2011. 07. 13.", plot: "모든 것을 끝낼 최후의 전투! 판타지의 아름다운 역사가 드디어 마침표를 찍는다! 덤블도어 교장이 남긴 ‘죽음의 성물’의 단서를 쫓던 해리 포터는 볼드모트가 그토록 찾아 다닌 절대적인 힘을 가진 지팡이의 비밀을 통해 드디어 마지막 퍼즐을 완성한다. 볼드모트의 영혼이 담긴 다섯 번째 ‘호크룩스’를 찾기 위해 마법학교 호그와트로 돌아온 해리와 친구들은 그들을 잡으려는 보안마법에 걸려 위기를 맞지만 덤블도어의 동생인 에버포스의 도움으로 벗어난다. 그리고 그에게서 덤블도어와 어둠의 마법사 그린델왈드에 관한 놀라운 과거에 대해 알게 된다. 한편, 볼드모트는 해리에 의해 호크룩스들이 파괴되었음을 느끼고 호그와트로 향한다. 해리를 주축으로 한 불사조 기사단과 죽음을 먹는 자들 간의 마법전투가 벌어지고 여기에 거대거미 아크로맨투라와 거인족 등 마법 생물들이 볼드모트 편으로 가세하면서 호그와트는 거대한 전쟁터로 변한다. 전쟁의 틈에서 해리는 덤블도어를 죽인 스네이프의 엄청난 비밀과 볼드모트를 죽일 마지막 호크룩스에 대한 단서를 알게 되는데...", posterImageName: "HarryPotter8")
