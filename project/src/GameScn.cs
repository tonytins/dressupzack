using Godot;

public enum ClothingType
{
    Shirts,
    Pants,
    Undies,
    Accessory
}

public class GameScn : Node
{
    void ChangeClothes(string path, ClothingType clothingType)
    {
        var texture = ResourceLoader.Load<Texture>($"res://sprites/{path}");

        switch (clothingType)
        {
            case ClothingType.Shirts:
                var top = GetNode<Sprite>("Nathan/Top");
                top.Texture = texture;
                break;
            case ClothingType.Pants:
                var bottom = GetNode<Sprite>("Nathan/Bottom");
                bottom.Texture = texture;
                break;
            case ClothingType.Undies:
                var undies = GetNode<Sprite>("Nathan/Undies");
                undies.Texture = texture;
                break;
            case ClothingType.Accessory:
                var accessory = GetNode<Sprite>("Nathan/Accessory");
                accessory.Texture = texture;
                break;
        }
    }

    TextureButton ClothesButton(string path, ClothingType clothingType)
    {
        switch (clothingType)
        {
            case ClothingType.Accessory:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Accessoires/AccsGrid/{path}");
            case ClothingType.Undies:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Underwear/UndiesGrid/{path}");
            default:
            case ClothingType.Pants:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Pants/PantsGrid/{path}");
            case ClothingType.Shirts:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Shirts/ShirtsGrid/{path}");
        }
    }

    public override void _Process(float delta)
    {
        // Accessories
        if (ClothesButton("CanonCam", ClothingType.Accessory).Pressed)
            ChangeClothes("camera.png", ClothingType.Accessory);

        // Pants
        if (ClothesButton("Jeans", ClothingType.Pants).Pressed)
            ChangeClothes("jeans.svg", ClothingType.Pants);
    }
}
