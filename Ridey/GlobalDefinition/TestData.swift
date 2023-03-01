//
//  TestData.swift
//  Ridey
//
//  Created by Lo Fang Chou on 2023/1/29.
//

import Foundation
import SwiftUI
import MapKit

let ridePlan1: RidePlan = RidePlan(planID: 1, fromLocation: "台北車站", toLocation: "台南車站", startTime: "5月3日 上午10:00 自台北車站出發", isDriver: true)
let ridePlan2: RidePlan = RidePlan(planID: 2, fromLocation: "台南車站", toLocation: "W Hotel", startTime: "5月5日 上午11:00 自台南車站出發")
let ridePlan3: RidePlan = RidePlan(planID: 2, fromLocation: "高雄車站", toLocation: "H Hotel", startTime: "5月6日 上午09:00 自高雄車站出發", isDriver: true)
let ridePlan4: RidePlan = RidePlan(planID: 2, fromLocation: "台中車站", toLocation: "台北車站", startTime: "6月7日 上午10:00 自台中車站出發")
let ridePlan5: RidePlan = RidePlan(planID: 2, fromLocation: "嘉義車站", toLocation: "台中車站", startTime: "6月8日 下午01:00 自嘉義車站出發", isDriver: true)
let ridePlan6: RidePlan = RidePlan(planID: 2, fromLocation: "桃園車站", toLocation: "屏東車站", startTime: "6月9日 下午02:00 自桃園車站出發")

let tripInfo1: TripInformation = TripInformation(itemNo: "A", startLocation: "台北車站", startTime: "上午11:30", toLocation: "台南車站", durationTime: "約3小時45分鐘", driveScoring: "4.3")
let tripInfo2: TripInformation = TripInformation(itemNo: "B", startLocation: "W Hotel", startTime: "上午9:30", toLocation: "台南車站", durationTime: "約3小時45分鐘", driveScoring: "4.3")
let tripInfo3: TripInformation = TripInformation(itemNo: "C", startLocation: "南港展覽館", startTime: "下午6:30", toLocation: "林百貨", durationTime: "約4小時3分鐘", driveScoring: "4.7")
let tripInfo4: TripInformation = TripInformation(itemNo: "D", startLocation: "中正紀念堂", startTime: "下午7:45", toLocation: "新光三越新天地", durationTime: "約3小時50分鐘", driveScoring: "4.0")
let tripInfo5: TripInformation = TripInformation(itemNo: "E", startLocation: "捷運大安站", startTime: "下午9:00", toLocation: "台南市政府", durationTime: "約4小時12分鐘", driveScoring: "4.6")

let tripInfoList: [TripInformation] = [tripInfo1, tripInfo2, tripInfo3, tripInfo4, tripInfo5]

let REGISTER_WELCOME_DESCRIPTION: String = "歡迎來共乘，您正在使用 example@carpool.com 首次登入 Ridey，請先詳閱並同意我們的會員條款．"
let REGISTER_WELCOME_DESCRIPTION2: String = "歡迎來Ridey，非常感謝您一起加入共乘的大家庭，一起為地球的碳排放貢獻一份心力，請注意因為共乘為自發性的互利行為，因此在旅程中，結交朋友同時也請以禮待人，讓我們共同塑造美好的共乘環境。"
let REGISTER_EMAIL_VERIFICATION_DESCRIPTION: String = "我們已經寄了一封電子郵件至您所提供的電子信箱，請查看信箱並點擊郵件內的連結驗證電子郵件位置"
let REGISTER_EMAIL_VERIFICATION_DESCRIPTION2: String = "沒有收到信件？30秒後可以重新寄送郵件。如果您想用其他電子信箱註冊會員，請登出並重新登入或註冊。"
let REGISTER_OTP_VERIFICATION_DESCRIPTION: String = "我們會傳送一封簡訊至您填入的手機號碼，驗證碼在30分鐘內有效，請您查看您的訊息並將驗證碼填入下方欄位。"
let REGISTER_COMPLETE_DESCRIPTION: String = "您現在已經可以申請搭乘Ridey中的各個共乘行程。\n\n我們歡迎所有有自駕需求，且願意以自有車輛提供共乘行程的會員，加入我們共乘駕駛的行列，為愛護地球一起盡一份心力❤️"

let DRIVER_APPLY_WELCOME_DESCRIPTION: String = "在申請成為共乘駕駛之前，請先閱讀並同意駕駛條款。"
let DRIVER_ID_IMAGE_DESCRIPTION: String = "請上傳您的身分證、駕照、行照和其他資料供平台審查。"
let DRIVER_ID_IMAGE_DESCRIPTION2: String = "請上傳可見本人清晰面容，以及身份證件的合影"
let DRIVER_GOOD_PEOPLE_PROOF: String = "非強制上傳，我們會在共乘行程上為有認證的駕駛標上額外的註記揭露。"
let IMAGE_BACKGROUND_TEXT1: String = "請點此上傳\n請上傳可見姓名、出生日期和照片的身分證相片，請自行遮蔽重要資訊"
let IMAGE_BACKGROUND_TEXT2: String = "請點此上傳"
let DRIVER_INFO_WELCOME_DESCRIPTION: String = "我們想請您與我們分享一些有關您的資訊，共乘的乘客將會在您所駕駛的共乘行程中看到這些資訊。部分欄位為非必填。"
let DRIVER_CAR_WELCOME_DESCRIPTION: String = "接著想請您分享有關您的車輛。如果車子不在身邊或現在無法填入這些項目，您可以略過並稍後再至會員個人資料頁面填入。"
let DRIVER_COMPLETE_WELCOME_DESCRIPTION: String = "非常感謝您願意跟我們一同創造共乘，我們將針對您所提供的資訊進行審核，並且將審核結果寄送至您的電子信箱中，Ridey期待與您相會！"
let CREATE_TRIP_COMPLETE_WELCOME_DESCRIPTION: String = "您的共乘申請已經成功寄出，待乘客確認資訊後將會成功媒合，請留意相關Email寄送至您的信箱喔！\n\n請注意，為維護良好的共乘品質，若需要更改旅程或者取消時間，請至系統點選取消共乘。"
let APPLY_TRIP_COMPLETE_WELCOME_DESCRIPTION: String = "您的共乘申請已經成功寄出，待對方確認資訊後將會成功媒合，請留意相關Email寄送至您的信箱喔！\n\n請注意，為維護良好的共乘品質，若需要更改行程或者取消時間，請至系統點選取消共乘。"


let DRIVE_YEAR: [String] = ["2年以下", "2-5年", "6-10年", "11-15年", "16-20年", "20年以上"]
let DRIVE_FAVORITE: [String] = ["安靜", "歡樂", "氛圍A", "氛圍B"]
let CITY_DATA: [String] = ["基隆市", "新北市", "台北市", "桃園市", "台中市", "嘉義市", "台南市", "高雄市", "屏東市", "花蓮市", "宜蘭縣", "台東市"]

let membershipTerms: String = "一、會員服務條款\n1.本會員服務條款所稱之「會員」，為依照本站所定之加入會員程序加入完成並通過認證者。\n2.當您使用本站服務時，即表示您同意及遵守本服務條款的規定事項及相關法律之規定。\n3.本站保留有審核加入會員資格之權利，另外已加入會員者，本站亦保留有解除其會員資格之權利。\n4.本會員服務條款之修訂，適用於所有會員，當本站修訂本服務條款時，將於本站上公告。\n\n二、隱私權保護\n尊重並依據本網站「隱私權保護聲明」保護您的隱私(請參閱「隱私權保護聲明」條款)。\n\n三、會員\n1.使用本站所提供之會員服務時，於加入會員時所登錄之帳號及密碼使用之。\n2.會員須善盡帳號及密碼的使用與管理之責任。對於使用該會員之帳號及密碼(無關於會員本身或其他人)利用本站服務所造成或衍生之所有行為及結果，會員須自行負擔全部責任。\n3.會員之帳號及密碼遺失，或發現無故遭第三者盜用時，應立即通知本站連絡掛失，因未即時通知，導致本站無法有效防止及修改時，所造成的所有損失，會員應自負全責。\n4.每次結束使用本服務，執行會員之登出並關閉視窗，以確保您的會員權益。\n5.盜用第三者會員之帳號及密碼，導致第三者或本公司遭其他第三人或行政機關之調查或追訴時，第三者會員或本公司有權向您請求損害賠償，包括但不限於訴訟費用、律師費及商譽損失等。\n\n"


let pointsOfInterest = [
    AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708))]

var chatInfo1: ChatInformation = ChatInformation(chatID: 0, imageName: "spider_man", time: "11/2 上午09:00", fromTo: "台北車站 → 台南車站", driverName: "SpiderMan",  passengerName: "", lastMessage: "最後一則訊息文字顯示在這裡，最多只能顯示一行", typeHasNewMessage: 0, typeGroupChat: 0, chatFunctionType: 0)
var chatInfo2: ChatInformation = ChatInformation(chatID: 1, imageName: "captain_america", time: "11/8 上午11:00", fromTo: "台南車站 → 嘉義車站", driverName: "Captain",  passengerName: "", lastMessage: "最後一則訊息文字顯示在這裡，最多只能顯示一行", typeHasNewMessage: 1, typeGroupChat: 0, chatFunctionType: 0)
var chatInfo3: ChatInformation = ChatInformation(chatID: 2, imageName: "iron_man", time: "11/11 下午03:00", fromTo: "桃園車站 → 雲林車站", driverName: "IronMan",  passengerName: "SpiderMan", lastMessage: "最後一則訊息文字顯示在這裡，最多可以顯示兩行，能夠看到更多訊息，最多可以顯示兩行，能夠看到更多訊息", typeHasNewMessage: 0, typeGroupChat: 1, chatFunctionType: 1)
var chatInfo4: ChatInformation = ChatInformation(chatID: 3, imageName: "spider_man", time: "11/21 上午07:30", fromTo: "台中車站 → 屏東車站", driverName: "SpiderMan",  passengerName: "Captain", lastMessage: "最後一則訊息文字顯示在這裡，最多可以顯示兩行，能夠看到更多訊息", typeHasNewMessage: 1, typeGroupChat: 1, chatFunctionType: 2)
var chatInfo5: ChatInformation = ChatInformation(chatID: 4, imageName: "captain_america", time: "12/3 上午10:20", fromTo: "花蓮車站 → 台東車站", driverName: "Captain",  passengerName: "IronMan", lastMessage: "最後一則訊息文字顯示在這裡，最多可以顯示兩行，能夠看到更多訊息", typeHasNewMessage: 1, typeGroupChat: 1, chatFunctionType: 3)
var chatInfo6: ChatInformation = ChatInformation(chatID: 5, imageName: "iron_man", time: "12/3 上午10:20", fromTo: "花蓮車站 → 台東車站", driverName: "IronnMan",  passengerName: "SpiderMan", lastMessage: "最後一則訊息文字顯示在這裡，最多可以顯示兩行，能夠看到更多訊息", typeHasNewMessage: 1, typeGroupChat: 1, chatFunctionType: 4)

var chatInfoArray: [ChatInformation] = [chatInfo1, chatInfo2, chatInfo3, chatInfo4, chatInfo5, chatInfo6]

let message1: MessageContent = MessageContent(messageID: 1, imageName: "captain_america", sender: "Captain", isDriver: false, message: "Thanos is going to attack Earth on 2023/03/01 !!", time: "上午 09:30", type: "S")

let message2: MessageContent = MessageContent(messageID: 2, imageName: "spider_man", sender: "SpiderMan", isDriver: true, message: "Really? Then I need to take a long time vacation from school. How about to invite other heroes to join this final fight? Together we can win this war!", time: "上午 09:31", type: "R")

let message3: MessageContent = MessageContent(messageID: 3, imageName: "iron_man", sender: "IronMan", isDriver: false, message: "I am in, boy", time: "上午 09:32", type: "R")

let message4: MessageContent = MessageContent(messageID: 4, imageName: "captain_america", sender: "Captain", isDriver: false, message: "God bless Earth!!!", time: "上午 09:33", type: "S")

let messageTemplate: [MessageContent] = [message1, message2, message3, message4]
