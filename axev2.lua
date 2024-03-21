local Maid, Ancestor, GUISettings, Connections = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/Maid.txt'))(), {

    SelectedTreeType               = 'Generic',
    BringTreeAmount                = 1,
    AutobuyAmount                  = 1,
    AutobuySelectedItem            = 'Basic Hatchet',
    BringTreeSelectedPosition      = 'Current Position',
    RotatingObject                 = false,
    Sprinting                      = false,
    ModerationType                 = 'Vehicle',
    ModerationAction               = 'Kill',
    LatestSupportedVersion         = '2259',
    LatestSupportedUnsecureVersion = '16',
    InventoryDuplicationAmount     = 1,
    PropertyToDuplicate            = 1,
    PlayerToDuplicatePropertyTo    = game.Players:GetPlayers()[1],
    PropertySavingTarget           = game.Players:GetPlayers()[1],
    ModWoodSawmill                 = nil,
    AutofarmTrees                  = false,
    CharacterGodMode               = 'FirstTimeExecutionProtection',
    IsClientFlying                 = false,
    TreeToDismember                = false,
    SelectedVehicleColourToSpawn   = 'Dark red',
    CurrentlySavingOrLoading       = nil,
    DonatingProperty               = false,
    SpawnItemsQuantity               = 1,
    SpawnItemName                  = 'BasicHatchet',
    ModdingWood                    = false,
    Unsecure                       = game.PlaceId == 10042772221,
    ItemToSpawn                    = 'Basic Hatchet',
    SpawnItemsQuantity             = 1,
    AutobuildFileNameSaver         = 'Template',
    AutobuildFileNameLoader        = 'Template',
    AutobuildSaverTarget           = tostring(game.Players:GetPlayers()[1]),
    AutobuildLoaderTarget          = tostring(game.Players:GetPlayers()[1]),
    SetMoneyAmount                 = 1,
    PaintingStructures             = {},
    PaintWoodClass                 = 'Generic',
    AbortAutobuild                 = false,
    SpawningItems                  = false,
    ItemSpawnerCompleted           = false,
    LassoSelect                    = false,
    MoneyWiping                    = false,
    MoneyWipeTarget                = game.Players:GetPlayers()[1],
    AutobuildLink                  = 'Truck Base',
    PropertyToMoneyDuplicate       = 1,
    PlayerToMoneyDuplicateTo       = game.Players:GetPlayers()[1]

}, {
    
    WalkSpeed                          = 16,
    JumpPower                          = 50,
    HipHeight                          = 0,
    SprintSpeed                        = 20,
    FOV                                = 70,
    InfiniteJump                       = false,
    SelectedDropType                   = 'Both',
    Light                              = false,
    SprintKey                          = 'LeftShift',
    NoclipKey                          = 'LeftControl',
    KeyTP                              = 'G',
    FastCheckout                       = false,
    FixCashierRange                    = false,
    HardDragger                        = false,
    AxeRangeActive                     = false,
    AxeSwingActive                     = false,
    FlyKey                             = 'F',
    WaterWalk                          = false,
    WaterFloat                         = true,
    FlySprintSpeed                     = 10,
    AlwaysDay                          = false,
    AlwaysNight                        = false,
    NoFog                              = false,
    AxeSwing                           = 0,
    AxeRange                           = 0,
    FlySpeed                           = 200,
    CarSpeed                           = 1,
    CarPitch                           = 1,
    AntiAFK                            = (Executor ~= 'Krnl' and true) or false,
    TreesEnabled                       = true,
    StopPlayersLoading                 = false,
    SignDuplicationAmount              = 1,
    TeleportBackAfterBringTree         = true,
    FastRotate                         = false,
    XRotate                            = 1,
    YRotate                            = 1,
    SelectedTreeTypeSize               = 'Largest',
    ActivateVehicleModifications       = true,
    AutoSaveGUIConfiguration           = true,
    Brightness                         = 1,
    GlobalShadows                      = true,
    RejoinExecute                      = false,
    UnboxItems                         = false,
    FreeCamera                         = false,
    WaterGodMode                       = false,
    BetterGraphics                     = false,
    DropToolsAfterInventoryDuplication = false,
    InstantDropAxes                    = false,
    ClickDelete                        = false,
    SellPlankAfterMilling              = false,
    AutoStopOnPinkVehicle              = false,
    DeleteSpawnPadAfterVehicleSpawn    = false,
    AutoChopTrees                      = false,
    SitInAnyVehicle                    = false,
    ClickToSell                        = false,
    SlotSaving                         = true,
    SpawnBoxed                         = false,
    LoadSquares                        = true,
    AutoUnboxGifts                     = false,
    IgnoreAnchoredStructures           = true,
    AutobuildAutoLand                  = true,
    StructureOnly                      = false,
    PaintTool                          = false,
    BypassLoadTimer                    = false,

}, {}

local Players, TeleportService, UIS, CoreGui, StarterGui, Lighting, RunService, ReplicatedStorage, HttpService, PerformanceStats, UserInputService, Terrain = game:GetService('Players'), game:GetService('TeleportService'), game:GetService('UserInputService'), game:GetService('CoreGui'), game:GetService('StarterGui'), game:GetService('Lighting'), game:GetService('RunService'), game:GetService('ReplicatedStorage'), game:GetService('HttpService'), game:GetService('Stats').PerformanceStats, game:GetService('UserInputService'), workspace.Terrain
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local Mouse = Player:GetMouse()

getgenv().Character = Player.Character or Player.CharacterAdded:Wait()

local PlayerGui, Camera = Player.PlayerGui, workspace.CurrentCamera

local Properties, Stores, PlayerModels = Workspace.Properties:GetChildren(), Workspace.Stores:GetChildren(), Workspace.PlayerModels

local NPCChattingClient, CharacterFloat, PropertyPurchasingClient, LoadSaveClient, UserInput, InteractionPermission = getsenv(PlayerGui.ChatGUI.NPCChattingClient), getsenv(PlayerGui.Scripts.CharacterFloat), getsenv(PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient), getsenv(PlayerGui.LoadSaveGUI.LoadSaveClient), getsenv(PlayerGui.Scripts.UserInput), require(ReplicatedStorage.Interaction.InteractionPermission)

local RequestLoad, RequestSave, GetMetaData, ClientMayLoad, SendUserNotice, ClientExpandedProperty, ClientPurchasedProperty, ClientInteracted, ClientIsDragging, RemoteProxy, PromptChat, PlayerChatted, SetChattingValue, TestPing, ClientPlacedStructure, SelectLoadPlot, ClientPlacedBlueprint, DestroyStructure, Donate = ReplicatedStorage.LoadSaveRequests.RequestLoad, ReplicatedStorage.LoadSaveRequests.RequestSave, ReplicatedStorage.LoadSaveRequests.GetMetaData, ReplicatedStorage.LoadSaveRequests.ClientMayLoad, ReplicatedStorage.Notices.SendUserNotice, ReplicatedStorage.PropertyPurchasing.ClientExpandedProperty, ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty, ReplicatedStorage.Interaction.ClientInteracted, ReplicatedStorage.Interaction.ClientIsDragging, ReplicatedStorage.Interaction.RemoteProxy, ReplicatedStorage.NPCDialog.PromptChat, ReplicatedStorage.NPCDialog.PlayerChatted, ReplicatedStorage.NPCDialog.SetChattingValue, ReplicatedStorage.TestPing, ReplicatedStorage.PlaceStructure.ClientPlacedStructure, ReplicatedStorage.PropertyPurchasing.SelectLoadPlot,  ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint, ReplicatedStorage.Interaction.DestroyStructure, ReplicatedStorage.Transactions.ClientToServer.Donate

function Ancestor:GetConnection(Name, DisconnectConnection)

    for Connection, Data in next, Connections do

        if tostring(Connection) == tostring(Name) then

            if DisconnectConnection then

                Data.Function:Disconnect()
                Connections[Name] = nil

                return false

            end

            return Data.Function

        end
        
    end

    return false

end

function Ancestor:DropTool(Axe)

    ClientInteracted:FireServer(Axe, 'Drop tool',Player.Character.PrimaryPart.CFrame)

end

function Ancestor:MergeTables(Tbl, NewTbl)

    for Index, Value in next, Tbl do 

        NewTbl[#NewTbl + 1] = Value 

    end

    return NewTbl

end

function Ancestor:GetAxes()

    local Axes = {}
    local Tools = self:MergeTables(Player.Backpack:GetChildren(), Player.Character:GetChildren())

    for i = 1, #Tools do

        local Axe = Tools[i]

        if Axe:FindFirstChild('CuttingTool') then

            Axes[#Axes + 1] = Axe

        end

    end

    return Axes

end

function Ancestor:HardDragger(State)
    if State then
        workspace.ChildAdded:Connect(function(Dragger)

        if tostring(Dragger) == 'Dragger' then

            local BodyGyro = Dragger:WaitForChild('BodyGyro')
            local BodyPosition = Dragger:WaitForChild ('BodyPosition')
            repeat Maid.Timer:Wait() until workspace:FindFirstChild('Dragger')

            repeat Maid.Timer:Wait()

                BodyPosition.P = 10000 * 8
                BodyPosition.D = 1000
                BodyPosition.maxForce = Vector3.new(1, 1, 1) * 1000000
                BodyGyro.maxTorque = Vector3.new(1, 1, 1) * 200
                BodyGyro.P = 1200
                BodyGyro.D = 140

            until not workspace:FindFirstChild('Dragger')

            -->Revert
            BodyPosition.P = 10000
            BodyPosition.D = 800
            BodyPosition.maxForce = Vector3.new(17000, 17000, 17000)
            BodyGyro.maxTorque = Vector3.new(200, 200, 200)
            BodyGyro.P = 1200
            BodyGyro.D = 140

        end
    
    end)
    end

end

task.spawn(function()
    game.RunService.RenderStepped:Connect(function()
        Lighting.TimeOfDay = '12:00:00'
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)

        Lighting.FogEnd = 1000000
    end)
end)

local BoughtAxe = false

function buyBasichatchet()
    local LastPosition = Player.Character.PrimaryPart.CFrame

    local ItemInfo

    local ClientItemInfo = ReplicatedStorage.ClientItemInfo

    local Items = ClientItemInfo:GetChildren()

    for i = 1, #Items do 
    
        local ItemZ = Items[i]
        local ItemName = ItemZ:FindFirstChild('ItemName')

        if ItemName and ItemName.Value == 'Basic Hatchet' then 
            
            ItemInfo = ItemZ
            
        end
    end

    local Item

    for i = 1, #Stores do 

        local Store = Stores[i]

        if tostring(Store) == 'ShopItems' then 

            local StoreItems = Store:GetChildren()

            for i = 1, #StoreItems do 

                local StoreItem = StoreItems[i]

                local BoxItemName = StoreItem:WaitForChild('BoxItemName')

                if BoxItemName and BoxItemName.Value == "BasicHatchet" then 

                    Item = StoreItem

                end

            end

        end

    end

    if (Player.Character.Head.CFrame.p - Item.PrimaryPart.CFrame.p).Magnitude > 10 then
        
        local LastBoxPos = Item.PrimaryPart.CFrame

        Player.Character.HumanoidRootPart.Velocity = Vector3.new()
        Player.Character.HumanoidRootPart.RotVelocity = Vector3.new()

        Player.Character:PivotTo(CFrame.new(Item.PrimaryPart.CFrame.p + Vector3.new(0, 4, 4)))
        
        repeat Maid.Timer:Wait() until Item.PrimaryPart.CFrame ~= LastBoxPos
    end

    local Max = 9e9

    local CashierList = {}

    local Stores = workspace.Stores:GetChildren()

    for i = 1, #Stores do

        local Store = Stores[i]

        local Cashiers = Store:GetChildren()

        for i = 1, #Cashiers do

            local Cashier = Cashiers[i]

            if Cashier:FindFirstChild('Head') then

                CashierList[#CashierList + 1] = {

                    Model   = Cashier,
                    Counter = Cashier.Parent:FindFirstChild('Counter')

                }

            end

        end

    end

    for i = 1, #CashierList do 

        local Cashier = CashierList[i]

        if (Player.Character.Head.CFrame.p - Cashier.Model.Head.CFrame.p).Magnitude < Max then 

            Max = (Player.Character.Head.CFrame.p - Cashier.Model.Head.CFrame.p).Magnitude
            PurchaseDetails = Cashier 

        end

    end

    local PurchaseInformation = PurchaseDetails

    ClientIsDragging:FireServer(Item)
    Maid.Timer:Wait()

    Item:PivotTo(PurchaseInformation.Counter.CFrame)

    local LastItemPosition = Item.PrimaryPart.CFrame

    repeat Maid.Timer:Wait() until Item.PrimaryPart.CFrame ~= LastItemPosition

    Player.Character.HumanoidRootPart.Velocity = Vector3.new()
    Player.Character.HumanoidRootPart.RotVelocity = Vector3.new()

    Player.Character:PivotTo(CFrame.new(Item.PrimaryPart.CFrame.p + Vector3.new(0, 4, 4)))

    Maid.Timer:Wait(1.5)

    PlayerChatted:InvokeServer({Character = PurchaseDetails.Model, Name = PurchaseDetails.Model, ID = 7}, 'ConfirmPurchase')

    repeat Maid.Timer:Wait() until Player.leaderstats.Money.Value == 8

    ClientInteracted:FireServer(Item, 'Open box')

    Maid.Timer:Wait(1)

    for i, v in (PlayerModels:GetChildren()) do
        if v.Name == "Model" and v.Owner.Value == Player then
            ClientInteracted:FireServer(v, "Pick up tool")

            Maid.Timer:Wait(0.5)

            Player.Character.HumanoidRootPart.Velocity = Vector3.new()
            Player.Character.HumanoidRootPart.RotVelocity = Vector3.new()

            Player.Character:PivotTo(LastPosition)
        end
    end

    BoughtAxe = true
end

local ThrownAxeY = nil
local AxeFlingY = nil

Mouse.Button1Down:Connect(function()

    if BoughtAxe == false then
        game:GetService('StarterGui'):SetCore('SendNotification', {
            Title = 'Axe Fling',
            Text = 'Buying basic hatchet...',
            Duration = 5
        })
        buyBasichatchet()
        return
    end

    Player.Character.Humanoid:UnequipTools()

    local Axe = Ancestor:GetAxes()[1]

    Ancestor:DropTool(Axe)

    local ActualPosition = Mouse.Hit.p

    PlayerModels.ChildAdded:Connect(function(ThrownAxe)

        local Owner, Main = ThrownAxe:WaitForChild('Owner'), ThrownAxe:WaitForChild('Main', 10)

        if Owner.Value == Player and ThrownAxe:FindFirstChild('ToolName') then

            local AxeFling = Instance.new('BodyPosition', Main)

            AxeFlingY = AxeFling
            ThrownAxeY = ThrownAxe

            AxeFling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            AxeFling.P = 10
            AxeFling.Position = ActualPosition
            Main.CanCollide = false

            local highlight = Instance.new("Highlight", Main)

        end

    end)
end)

Mouse.Button1Up:Connect(function()
    ClientInteracted:FireServer(ThrownAxeY, 'Pick up tool')
end)


workspace.ChildAdded:Connect(function(Dragger)
    if tostring(Dragger) == 'Dragger' then

        local BodyGyro = Dragger:WaitForChild('BodyGyro')
        local BodyPosition = Dragger:WaitForChild ('BodyPosition')
        repeat Maid.Timer:Wait() until workspace:FindFirstChild('Dragger')

        repeat Maid.Timer:Wait()

            BodyPosition.P = 10000 * 8
            BodyPosition.D = 1000
            BodyPosition.maxForce = Vector3.new(1, 1, 1) * 1000000
            BodyGyro.maxTorque = Vector3.new(1, 1, 1) * 200
            BodyGyro.P = 1200
            BodyGyro.D = 140

        until not workspace:FindFirstChild('Dragger')

        -->Revert
        BodyPosition.P = 10000
        BodyPosition.D = 800
        BodyPosition.maxForce = Vector3.new(17000, 17000, 17000)
        BodyGyro.maxTorque = Vector3.new(200, 200, 200)
        BodyGyro.P = 1200
        BodyGyro.D = 140

    end
end)

local heldDown = false

game.UserInputService.InputBegan:Connect(function(key, isSystemReserved)
    if (key.UserInputType == Enum.UserInputType.MouseButton1) and ThrownAxeY ~= nil then -- if the key/input object is the mouse button 1
        heldDown = true
    end
end)

game.UserInputService.InputEnded:Connect(function(key, isSystemReserved)
    if (key.UserInputType == Enum.UserInputType.MouseButton1) and ThrownAxeY ~= nil then -- if the key/input object is the mouse button 1
        heldDown = false
    end
end)

spawn(function()
	while Maid.Timer:Wait() do
		if heldDown then
            local ActualPosition = Mouse.Hit.p

            print(ActualPosition)
            pcall(function()
                ClientIsDragging:FireServer(ThrownAxeY)
                ThrownAxeY.Main.CFrame = game:GetService('Players').LocalPlayer:GetMouse().Hit
                AxeFlingY.Position = ActualPosition
                ThrownAxeY.Main.RotVelocity = Vector3.new(1, 1, 1) * 9e9
            end)
        end
	end
end)
