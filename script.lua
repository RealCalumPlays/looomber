repeat wait() until game:IsLoaded()

for _,plr in (game.Players:GetChildren()) do
    if plr.leaderstats.Money > 100000 then
        run()
    else
        do_search()
    end
end

function do_search()
    local servers = {}
    local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
    local body = HttpService:JSONDecode(req.Body)
    if body and body.data then
        for i, v in next, body.data do
            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                table.insert(servers, 1, v.id)
            end
        end
    end
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
    else
        print("nuh uh")
    end
end

local TeleportCheck = false

game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	if not TeleportCheck then
		TeleportCheck = true
		queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/RealCalumPlays/looomber/main/script.lua'))()")
	end
end)

function run()

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

    task.spawn(function()
        game.RunService.RenderStepped:Connect(function()
            Lighting.TimeOfDay = '12:00:00'
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)

            Lighting.FogEnd = 1000000
        end)
    end)

            Mouse.Button1Down:Connect(function()

                Player.Character.Humanoid:UnequipTools()
                
                local Axe = Ancestor:GetAxes()[1]
            
                Ancestor:DropTool(Axe)

                local ActualPosition = Mouse.Hit.p
            
                PlayerModels.ChildAdded:Connect(function(ThrownAxe)
            
                    local Owner, Main = ThrownAxe:WaitForChild('Owner'), ThrownAxe:WaitForChild('Main', 10)

                    if Owner.Value == Player and ThrownAxe:FindFirstChild('ToolName') then
            
                        local AxeFling = Instance.new('BodyPosition', Main)
            
                        AxeFling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        AxeFling.P = 65000 * 5
                        AxeFling.Position = ActualPosition
                        Main.CanCollide = false
                    
                        repeat Maid.Timer:Wait()
                            
                            Main.RotVelocity = Vector3.new(1, 1, 1) * 9e9
                            ClientIsDragging:FireServer(ThrownAxe)
                        
                        until (Main.CFrame.p - AxeFling.Position).Magnitude < 15
                        
                        Maid.Timer:Wait(2.5)
            
                        ClientInteracted:FireServer(ThrownAxe, 'Pick up tool')
            
                    end
            
                end)
            end)
        end
