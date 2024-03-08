//
//  ViewController.swift
//  IOS
//
//  Created by Josep Romera Andreu on 9/2/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK: LifeCircle
    
    override func loadView(){
        super.loadView()
        //This function is called when view is nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Here can call to api calls or setup view object with external data
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Aparece cuando vuelves abrir la aplicacio
        super.viewWillAppear(animated)
        //This function is called before screen appear
        //Sizes and positions of objects, don't calculated
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //This function is called before calculate sub views sizes and positions
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //This function is called after calculate sub views sizes and positions
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //This function is called after screen appear
        //Sizes and positions of objects, is calculated
    }
    deinit{
        
    }
    
    //MARK: Functions
    func defineFunctionTest(varName: Int /*Type*/ )-> Int /*Returned Value */{
        return 0
    }
    
    @discardableResult
    func defineFunctionWarning(var Name: Int)->Int{
        return 0
    }
    
    //MARK: VarTypes
    func testVariables(){
        var a: Int = 0
        a += 1
        
        let b: Int = 0
        //b += 2 Left side of mutating operator isn't mutable: 'b' is a 'let' constant
    }
    //MARK: Optionals
    func testOptionals(){
        //var a: Int Se ha de inicializar la variable
        
        var b: Int = 0
        b+=1
        var c: Int?
        
        //No hacer
        //b = c
        if var c = c{
            b = c
        }
        //nil cannot be assigned to type Int
        //b = nil
        c = nil
        b = c ?? 0
        
        guard var c = c else {
            return
        }
        b = c
    }
    
    //MARK: CLASES Y PROTOCOLOS
    class TestObject{
        var a: Int
        let b: Int
        var c: Int?
        
        init(a: Int, b: Int, c: Int? = nil) {
            self.a = a
            self.b = b
            self.c = c
        }
        
        func addOneToAll(){
            self.a = 1
            a+=1
            
            //self.b+1 //Es un let. no se puede sumar aca
            //self.c += 1 Puede ser null
            
            //JAMAS
            //self.c! += 1
            if var c = c{
                c += 1
            }
        }

    }
    func testClass(){
        var nonOptionalClass = TestObject(a: 2, b: 3)
        //var optionalClass = nil
        var optionalClass:TestObject? = nil
        
        nonOptionalClass.addOneToAll()
        
        //Si la clase es nil no llamara a la funcion y tampoco generara error
        optionalClass?.addOneToAll()
        
        nonOptionalClass.a = optionalClass?.a ?? 1
        
        var test: Int? = 32
        var test2: Int? = 32
        
        nonOptionalClass.a = optionalClass?.a ?? test ?? test2 ?? { return 5}()
        if let optionalClass = optionalClass{
            nonOptionalClass.a = optionalClass.a
        }
        if optionalClass != nil{
            var i = 0
        }
        guard let optionalClass = optionalClass else{
            return
        }
        nonOptionalClass.a = optionalClass.a
        
    }
 
}
extension ViewController.TestObject{
    //Extension must not contain stored properties
    //Las extensiones no pueden declarar variables nuevas
    //var d: iNT
    
    func substractOneToAll(){
        a -= 1
        
        c = (c ?? 0) - 1
    }
    
}
extension ViewController{
    func testExtension(){
        var extendedObject = TestObject(a: 2, b: 3)
        extendedObject.substractOneToAll()
    }
}

protocol ReadableAsText{
    //
    var Text: String { get }
    
    func toText() -> String
}

extension ViewController.TestObject: ReadableAsText{
    var Text: String{
        return toText()
        }
    
        func toText()->String{
            var s = "d"
            s += "La varaible A es \(a)\n"
            s += "La variable B es " + b.formatted() + " \n"
            s += "La variable C es \(c)\n"
            return s
        }
}

extension ViewController{
    func testProtocol(){
        var extendedObject = TestObject(a: 2, b: 2)
        
        var aString = extendedObject.Text
        var bString = extendedObject.toText()
    }
}

//MARK: Iterations
extension ViewController{
    func testIterations(){
        var list: [Int] = []
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.forEach { item in
            print(item)
            debugPrint(item)
        }
        
        print(list)
        debugPrint(list)
        
        for item in list {
            print(item)
        }
        
        
        for i in 0...list.count{
            print(list[i])
        }
        var otherList = [Int](0...100)
        
        for number in otherList where number % 2 == 0{
            print(number)
        }
        
        var objectsClass: [TestObject] = []
        objectsClass.append(TestObject(a: 1, b: 1,c:1))
        
        for item in objectsClass where item.c != nil{
            print(item.c)
        }
        
        var i = 0
        while( i < 5){
            i += 1
        }
    }
}

//MARK: Enums

enum DayOfWeek{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

extension ViewController{
    func testEnumDayOfWeek(){
        //let day = DayOfWeek.friday
        let day: DayOfWeek = .monday
        
        switch(day){
            
        case .monday,.tuesday,.wednesday,.thursday,.friday:
            print("se curra")
            break

        case .saturday,.sunday:
            print("no se curra")
            break

        }
    }
}

extension DayOfWeek: CaseIterable{
    var TranslatedText: String{
        get{
            switch(self){
                
            case .monday:
                return "Lunes"
            case .tuesday:
                return "Martes"
            case .wednesday:
                return "Miercoles"
            case .thursday:
                return "Jueves"
            case .friday:
                return "Viernes"
            case .saturday:
                return "Sabado"
            case .sunday:
                return "Domingo"
            }
        }
    }
}
extension ViewController{
    func testEnumDayOfWeekIterable(){
        let allDaysOfWeek = DayOfWeek.allCases
        
        for day in allDaysOfWeek{
            print(day)
        }
    }
}

enum OperationResult<T> {
    case Succes(text: T)
    case Failure(error: Error, code: Int)
}

extension ViewController{
    func testEnumOperation(){
        let opResult = OperationResult<String>.Succes(text: "Exitoso")
        switch(opResult){
            
        case .Succes(text: let value):
            print(value)
            break
        case .Failure(error: let error, code: let code):
            print(code)
            break
        }
    }
}

enum MathOperation {
    case Add(a:Double,b:Double)
    case Substract(a:Double,b:Double)
    case Multiply(a:Double,b:Double)
    case Divide(a:Double,b:Double)
    case Module(a:Double,b:Double)
    
    var Result: Double {
        get {
            switch(self){
                
            case .Add(a: let a, b: let b):
                return a + b
            case .Substract(a: let a, b: let b):
                return a - b
            case .Multiply(a: let a, b: let b):
                return a * b
            case .Divide(a: let a, b: let b):
                return a / b
            case .Module(a: let a, b: let b):
                return a.truncatingRemainder(dividingBy: b)
            }
        }
    }
}

extension ViewController{
    func testEnumMathOperation(){
        let mathOp: MathOperation = .Add(a:5, b: 3)
        print(mathOp.Result)
        
        let result = MathOperation.Add(a: 3, b: 3).Result + MathOperation.Multiply(a: 4, b: 5).Result
        print(result)
        
        
    }
}
