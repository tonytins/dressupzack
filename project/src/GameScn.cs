using Godot;

public enum ClothingType
{
    Top,
    Bottom,
    Accessory
}

public class GameScn : Node
{
    void ChangeClothes(string path, ClothingType clothingType)
    {
        var texture = ResourceLoader.Load<Texture>(path);

        switch (clothingType)
        {
            case ClothingType.Top:
                var top = GetNode<Sprite>("Nathan/Accessory");
                top.Texture = texture;
                break;
            case ClothingType.Bottom:
                var bottom = GetNode<Sprite>("Nathan/Accessory");
                bottom.Texture = texture;
                break;
            case ClothingType.Accessory:
                var accessory = GetNode<Sprite>("Nathan/Accessory");
                accessory.Texture = texture;
                break;
        }
    }

    public override void _Process(float delta)
    {
        // Change clothes
        if (GetNode<TextureButton>("Clothes/Wordrobe/Accessoires/AccsGrid/CanonCam").IsPressed())
            ChangeClothes("res://sprites/camera.png", ClothingType.Accessory);
        
    }
}
