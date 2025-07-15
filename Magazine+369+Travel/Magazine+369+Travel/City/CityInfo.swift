//
//  CityInfo.swift 
//
//  Created by Den on 2025/01/05.
//

import Foundation
 
struct CityInfo {
    let city: [City] = [
        City(name: "방콕", englishName: "Bangkok", explain: "방콕, 파타야, 후아힌, 코사멧, 코사무이", cityImage: "https://images.unsplash.com/photo-1716872491897-078d9b89be49?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "오사카", englishName: "Osaka", explain: "오사카, 교토, 고베, 나라", cityImage: "https://images.unsplash.com/photo-1716881768763-4088391a445e?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "다낭", englishName: "Danang", explain: "다낭, 호이안, 후에", cityImage: "https://images.unsplash.com/photo-1716619240251-54a22779ed8a?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "제주", englishName: "Jeju", explain: "제주, 섭지코지, 성산일출봉", cityImage: "https://images.unsplash.com/photo-1716565679084-2c3dbececc5e?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: true),
        City(name: "부산", englishName: "Busan", explain: "부산, 해운대, 마린시티", cityImage: "https://images.unsplash.com/photo-1716619222059-62e8670293e6?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: true),
        City(name: "파리", englishName: "Paris", explain: "파리, 베르사유, 몽생미셀, 스트라스부르", cityImage: "https://images.unsplash.com/photo-1715638427009-8b0fe7096838?q=80&w=3542&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "시드니", englishName: "Sydney", explain: "시드니, 블루마운틴, 울릉공, 뉴캐슬", cityImage: "https://images.unsplash.com/photo-1716117273853-75a1989029f2?q=80&w=3464&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "전주", englishName: "Jeonju", explain: "전주, 한옥 마을, 오목대, 경기전", cityImage: "https://images.unsplash.com/photo-1715646527352-3e9a4e406952?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: true),
        City(name: "밀라노", englishName: "Milano", explain: "밀라노, 꼬모, 베로나, 베르가모, 시르미오네", cityImage: "https://plus.unsplash.com/premium_photo-1715616257496-5e14778bbc0c?q=80&w=3415&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "리스본", englishName: "Lisbon", explain: "리스본, 신트라, 카스카이스, 오비두스", cityImage: "https://images.unsplash.com/photo-1715559067654-d485ab2618aa?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "서울", englishName: "Seoul", explain: "서울, 남산타워, 롯데타워, 경복궁", cityImage: "https://images.unsplash.com/photo-1715880005923-0013a6820a72?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: true),
        City(name: "두바이", englishName: "Dubai", explain: "두바이, 아부다비, 알 아인", cityImage: "https://images.unsplash.com/photo-1715073145727-393bbded41d9?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "홍콩", englishName: "Hongkong", explain: "홍콩, 마카오", cityImage: "https://images.unsplash.com/photo-1715547748806-dab4f4dfbc85?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "토론토", englishName: "Toronto", explain: "토론토, 나이아가라, 킹스턴, 블루마운틴", cityImage: "https://images.unsplash.com/photo-1715645943531-a57960d41818?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: false),
        City(name: "대전", englishName: "Daejeon", explain: "대전, 성심당", cityImage: "https://plus.unsplash.com/premium_photo-1695084221958-079096c96e05?q=80&w=3461&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", domesticTravel: true),
    ]
}
