//
//  MusicDetailTableViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusicDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var authorLab: UILabel!
    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
        self.contentLab.numberOfLines = 0
        self.contentLab.text = "<p>我得跟叶柏继分手。</p> <p>栗雪吸了吸鼻子，把碗里最后一口粥吃干净，忍了又忍，想到早上刚化好的妆，到底也没敢让眼泪掉下来。</p> <p>其实他们俩之间也没什么大毛病。叶柏继算是个踏实人，虽然不够温柔体贴但好在没啥坏毛病，待人也好。栗雪没谈过几次恋爱，但当时遇见叶柏继的时候心里就在想，他可能就是会陪我一辈子的那个人。</p> <p>“我看人一向很准的，”她这样跟闺蜜解释，“见他第一眼我就知道他好。”</p> <p>爱情的开始都差不多，说到底两人也只是普通人，比起小说电影里的风花雪月，栗雪更喜欢这样温暖安心的日子。</p> <p>工作忙的时候就少见几次，微信里道个晚安，闲暇多时就约会、逛街，偶尔去近一点的古城旅游。她觉得这样的日子很好，她不介意自己爱他更多一点，自然也不介意他对自己偶尔的不上心。栗雪总想着，我愿意这么对他好就够了，日子嘛，过得下去就成。</p> <p>但谁的人心不是肉长的，付出不求回报这种事其实也只能骗骗自己。他们约好一周年那天一起吃饭，最近两人都有点忙，就约了时间地点下班碰头。</p> <p>其实好久没有这么正式的约会了。栗雪打扮得漂漂亮亮，化了很久不化的精致妆容，穿了新买的衣服，高高兴兴地赴约。</p> <p>然后一等就是三个小时。</p> <p>约的地方是有名的情侣餐厅，身边都是浓情蜜意的一对一对，服务人员礼貌地询问她要不要再添些热水，被她拒绝了。</p> <p>“临时加班，”他的微信这么写，“再等一下，应该一会儿就好了。”</p> <p>栗雪就在一次又一次的“再等一会儿”中再等一会儿。她安慰自己没关系，谁还没个突发情况呢，可她看着窗外越来越暗的天色，心头一团乱麻。</p> <p>她几乎从不让叶柏继等，夏天怕他热着，冬天怕他冻着，他不是很有耐心，等得久了会发脾气，也会抱怨，每到这时她只能抱着他的胳膊讨好地撒娇，“下次一定不会了，我保证。”</p> <p>叶柏继却总有事情。爱情是个不容易琢磨的事儿，可没吃过猪肉还没见过猪跑么。他会忘记她的早餐，会记错她爱吃的菜，也会忙于工作而忽略她。他不是个细心人，不懂她的心情，而在她看来，他似乎也懒得去懂。</p> <p>栗雪安慰自己，得过且过就很好，然而心头的火一点一点聚起来，好像要烧掉她最后一丝故作坚强。</p> <p>她等了三个小时零二十五分钟。叶柏继从外面进来，带来一身寒气，“等久了吧，对不起对不起……诶点菜了吗？先点菜吧。”</p> <p>他顺手接过服务员递来的菜单，埋头翻看，“你最近感冒，那就别吃辣了……”</p> <p>她愣了愣，才想起半个月前那次感冒，而她也明确记得她说过，“已经好了”。</p> <p>栗雪一颗心沉到谷底，她看着叶柏继，声音很轻，“柏继，别点了，我不想吃了。”</p> <p>叶柏继终于舍得抬头看她一眼，“怎么了？”</p> <p>她起身坐在他身边，轻轻扯了扯他的袖子，“我想吃糖葫芦，就那儿，马路斜对面就有，你去给我买呗。”</p> <p>他的视线跟着她一起看向窗外，然后不耐烦地皱了皱眉头，“外面那么冷，你想冻死我啊。”</p> <p>可是平时，明明不管多黑多冷，她也愿意去帮他买喜欢的啤酒啊。这日子，怎么就过成这样了呢。</p> <p>那天栗雪一个人回了家，沉默着把所有叶柏继的东西打包封箱然后扔出门外，做完这些的时候，她猛然意识到，这个她一厢情愿想要“一辈子”的人，其实早已走出自己的世界了吧。</p> <p>我得跟叶柏继分手。她想，再也不想凑合了，我被最后一根稻草压死了。</p> <p>栗雪是容易被一时冲动支配的人，那天她自觉心冷转身离开，回家就把叶柏继的东西收拾干净，可转眼几天，她就发现生活里突然少了一个人的悲哀。</p> <p>叶柏继在的时候，她觉得他很好，但也没有那么好。就是一个晃晃悠悠还不错的男朋友，她看得到他的好，也愿意接受他的不好。可一旦没了这个人，她的心里就像空了一大块的棉花，总也没处落地。</p> <p>卫生间的灯又坏了，热水器也出了故障。早上修眉不小心修坏了，顶着少一块的眉毛去上班心情分外糟糕。晚上回家洗了个温水冷水交替出现的澡，第二天果然不负所望地感冒了。</p> <p>她吃了药昏昏沉沉地躺在沙发上，脑子里不甚清楚地想着：希望这倒霉日子早点过去……还有一会儿睡醒了，一定要给修理工打电话。</p> <p>结果是修理工也不用来了，半梦半醒间听到厨房有乒乒乓乓的动静，她吓得瞬间惊醒，脑子懵了一会儿后缓缓坐起来，看到玄关处的一双黑皮鞋。</p> <p>“刚醒？”叶柏继从厨房走出来，看到她坐着，似乎愣了一下，“还难受吗？”</p> <p>栗雪摇摇头，随手拿起桌边的水杯，发现水竟然是温热的：“你什么时候来的？”</p> <p>“有一会儿了，”叶柏继截过她手上的水杯，转身又走回厨房，“别喝了，再给你兑点热的。”</p> <p>手里的杯子被抢走，她一时有点手足无措，于是又顺手扯了个抱枕抱着。她还是有点懵，自从那次发怒离开后，这是他们第一次见面，她一时不知道该以什么样的态度面对他。</p> <p>热水很快就端来了，叶柏继一边在厨房忙活一边絮絮叨叨地说他已经把灯和热水器修好，家里垃圾也扔下楼了，这几天老板又在临时加班……</p> <p>小厨房的热气冒出来，混杂着两个人聊天的声音，栗雪觉得这样温柔安心的场景真是好久不见，久到好像那已经是上辈子的事了。</p> <p>她知道叶柏继此刻也在小心翼翼，不然平时他根本没有这么多话，也不会为她一场小小的感冒奔波忙碌，甚至倒一杯热水等她睡醒。栗雪苦笑一声，不知道如今这样的情况该去怪谁。</p> <p>“我们俩的事我想了很久，”叶柏继斟酌着语气坐在沙发另一头，“最近太忙了，我的确没有关心到你……那天……也让你等久了……”</p> <p>栗雪低头听着，脑子里乱哄哄的不知该想些什么。她的思绪其实根本没跟着他走，相反，她想起半夜跑去二十四小时便利店给他买啤酒的自己，想起早上起床为他准备一碗热粥的自己，想来想去又想起望着窗外的车水马龙等他三个小时的自己。她有一点伤心，可很快，小厨房温暖的热气又在提醒她——如果放弃，你可能连这一点现世的安稳也不会拥有了。</p> <p>她好像陷在泥沼里，伸手能够到的，却是带钉的木板。是要在沼泽里逐渐下沉，还是宁可鲜血淋漓也要上岸——她是真的不懂。</p> <p>“栗雪……栗雪？”</p> <p>叶柏继探过头来看她，打断她的神游：“想什么呢？你……你对咱俩的事……”</p> <p>厨房里突然有了动静，他“哎呀”一声赶忙起身往厨房走，“我的粥……”</p> <p>又是一阵忙活，叶柏继端了个小碗出来，有点讨好地放在她面前：“我也不知道你爱喝什么，就做了简单的。”</p> <p>说是简单，其实看得出来下了心思，一碗粥做得花样百出，浓香四溢。栗雪一边拿勺子搅粥，一边听他继续刚才的话：“……我可能不是一个很称职的男朋友，之前也老惹你生气，但我也不是不上心啊，就是……嗨，咱俩一直挺好的，以后也好好的呗，这次你就原谅我……”</p> <p>栗雪总算明白他们两个差在哪里了。她已经努力思考了他们以后的一千步一万步，可他却只能看到脚下的地，改变太累了，他宁可这么糊涂着。</p> <p>她的心脏怦怦直跳，这一刻她才明白自己要的是什么——她总是想“这次就这样，下次就好了”，可事实证明下次、下下次也不会好，她想要改变，跳出生活的围城，摔得再痛也值得。</p> <p>“柏继，”栗雪打断他，将勺子放下，重新靠回沙发，“我们别这样了。”</p> <p>“……嗯？”叶柏继愣了一下。</p> <p>“我们俩，也许就这么过下去，也可以。但是……别了吧，路还长着呢，这么凑合着，不值得。我们总不能永远糊涂呀。”</p> <p>“栗雪，我也只是……”</p> <p>“我杏仁过敏，”栗雪将目光转向那碗被搅动半天却没有喝的粥，“我们刚在一起的时候，你给我买的蛋糕里不小心掺了杏仁，我在医院里躺了两天，后来你就再也没买过这些东西。”</p> <p>叶柏继的脸色很难看，他张了张嘴，颓然低下了头：“……我怎么连这个都忘了……”</p> <p>粥真的很香，可惜放了绝对不能放的杏仁，再好的食材也是白费。就像爱情，也许真的安稳，可惜两个人没了心，安稳就成了凑合。</p> <p>叶柏继离开的时候把家里钥匙还给她，“一个人住注意安全，有事给我打电话。”</p> <p>栗雪“嗯”了一声，低着头，不敢再说话，怕再开口就是哭音。</p> <p>“其实……其实，我们曾经也很好吧。”叶柏继低声说，“我真的想着这么下去就挺好。”</p> <p>栗雪也忘了送走他后自己有没有哭，反正以前该哭的没少哭，多一次少一次也无所谓。</p> <p>闺蜜说她矫情过头，其实她却清楚得很，完美的爱情不存在，可一颗滚烫的真心总是不难寻，她推翻了之前的生活，就是想试一下——下一次，如果她还愿意全心付出的话，能不能换回一次不再凑合的爱情。</p> <p>生活已经够难了，如果连这样本身就全靠虚无缥缈的感受来判断的东西都不能尽如人意，那还有什么意思呢。</p> <p>希望下一次……栗雪想了想，实在不知道该希望什么，就悄悄对自己说：“下一次，那个人必须记得不要放杏仁。”</p> "
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configUI() {
        
    }
    
}
